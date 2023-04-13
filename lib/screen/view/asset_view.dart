import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:admin_ui/screen/view/asset_detail_view.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/constant/enum/enums.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewModel/asset_view_model.dart';

void main() => runApp(const AssetView());

class AssetView extends StatelessWidget {
  const AssetView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width * 0.79,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: TextButton(
                        onPressed: null,
                        child: Text("Yeni Oluştur",
                            style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 55, 107, 251))),
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
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
          return DataTable(
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
                                                    0.3,
                                                child: AssetDetailView(id: element.id!)),
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
          );
      }
    });
  }
}