import 'package:admin_ui/core/util/size_config.dart';
import 'package:admin_ui/screen/view/site_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../../core/network/network_manager.dart';
import '../service/site_service.dart';
import '../viewModel/site_view_model.dart';

void main() => runApp(const SiteView());

class SiteView extends StatelessWidget {
  const SiteView({super.key});

  static const String _title = 'Alanlar';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init();
    SiteViewModel viewModel =
        SiteViewModel(SiteService(networkManager: NetworkManager()));
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: SizeConfig.width * 0.7,
                    child: TextField(
                      onChanged: (value) => viewModel.filter(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Alan İsmine Göre Ara"
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.height * 0.045,
                    width: SizeConfig.width * 0.07,
                    child: TextButton(
                        onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.24,
                                              child: SiteDetailView(id: null, buildContext: context,)),
                                        );
                                      });
                                },
                        child: Text("Yeni Oluştur",
                            style: TextStyle(color: Colors.white),),
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 55, 107, 251))),
                  ),
                ],
              ),
              Container(
                  width: SizeConfig.width,
                  child: MyStatelessWidget(viewModel: viewModel)),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final SiteViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (viewModel.dataState) {
        case DataState.LOADING:
          return Center(child: CircularProgressIndicator());
        case DataState.ERROR:
          return Center(
              child: Text("Alanlar görüntülenirken bir hata oluştu"));
        case DataState.READY:
          return Container(
            width: SizeConfig.width * 0.5,
            height: SizeConfig.height * 0.75,
            child: SingleChildScrollView(
              child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Id',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Ad',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: viewModel
                .siteList! // Loops through dataColumnText, each iteration assigning the value to element
                .map(
                  ((element) => DataRow(cells: <DataCell>[
                        DataCell(Text(element.id!.toString())),
                        DataCell(Text(element.name!.toString())),
                        DataCell(Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.24,
                                              child: SiteDetailView(id: element.id!, buildContext: context,)),
                                        );
                                      });
                                },
                                icon: Icon(Icons.navigate_next))
                          ],
                        ))
                      ])),
                )
                .toList(),
          )));
      }
    });
  }
}
