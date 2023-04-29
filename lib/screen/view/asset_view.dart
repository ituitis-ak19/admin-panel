import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:admin_ui/screen/view/asset_detail_view.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/constant/enum/enums.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/util/size_config.dart';
import '../viewModel/asset_view_model.dart';

void main() => runApp(const AssetView());

class AssetView extends StatelessWidget {
  const AssetView({super.key});

  static const String _title = 'Zimmetli Ürünler';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init();
    AssetViewModel viewModel = AssetViewModel(
        AssetService(networkManager: NetworkManager()));
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
                        labelText: "Zimmetli Ürün İsmine Göre Ara"
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
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.32,
                                                child: AssetDetailView(id: null, buildContext: context)),
                                          );
                                        });
                                  },
                        child: Text("Yeni Oluştur",
                            style: TextStyle(color: Colors.white)),
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
  final AssetViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (viewModel.dataState) {
        case DataState.LOADING:
          return Center(child: CircularProgressIndicator());
        case DataState.ERROR:
          return Center(
              child: Text("Zimmetli ürünler görüntülenirken bir hata oluştu"));
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
                    'Açıklama',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Veriliş Tarihi',
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
                .assetList! // Loops through dataColumnText, each iteration assigning the value to element
                .map(
                  ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(element.id!.toString())),
                          DataCell(Text(element.name!)), //Extracting from Map element the value
                          DataCell(Text(element.description!)),
                          DataCell(Text(element.dateOfIssue!)),
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
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.32,
                                                child: AssetDetailView(id: element.id!, buildContext: context,)),
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.navigate_next))
                            ],
                          ))
                        ],
                      )),
                )
                .toList(),
          )));
      }
    });
  }
}
