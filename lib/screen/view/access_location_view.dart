import 'package:admin_ui/screen/view/access_location_detail_view.dart';
import 'package:admin_ui/screen/viewModel/access_location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/network/network_manager.dart';
import '../service/access_location_service.dart';

void main() => runApp(const AccessLocationView());

class AccessLocationView extends StatelessWidget {
  const AccessLocationView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    AccessLocationViewModel viewModel = AccessLocationViewModel(
        AccessLocationService(networkManager: NetworkManager()));
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
  final AccessLocationViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (viewModel.dataState) {
        case DataState.LOADING:
          return Center(child: CircularProgressIndicator());
        case DataState.ERROR:
          return Center(
              child: Text("Giriş noktaları görüntülenirken bir hata oluştu"));
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
                'Tip',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Alan',
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
            .accessLocationList! // Loops through dataColumnText, each iteration assigning the value to element
            .map(
              ((element) => DataRow(cells: <DataCell>[
                    DataCell(Text(element.id!.toString())),
                    DataCell(Text(element.type!.toString())), //Extracting from Map element the value
                    DataCell(Text(element.siteName!)),
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
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.3,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.3,
                                          child: AccessLocationDetailView()),
                                    );
                                  });
                            },
                            icon: Icon(Icons.navigate_next))
                      ],
                    ))
                  ])),
            )
            .toList(),
      );
      }
    });
  }
}
