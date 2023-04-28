import 'package:admin_ui/screen/view/access_location_detail_view.dart';
import 'package:admin_ui/screen/viewModel/access_location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/network/network_manager.dart';
import '../../core/util/size_config.dart';
import '../service/access_location_service.dart';

void main() => runApp(const AccessLocationView());

class AccessLocationView extends StatelessWidget {
  const AccessLocationView({super.key});

  static const String _title = 'Giriş Noktaları';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init();
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
                    width: SizeConfig.width * 0.75,
                    child: TextField(
                      onChanged: (value) => viewModel.filter(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Giriş Noktası İsmine Göre Ara"
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.height * 0.05,
                    width: SizeConfig.width * 0.07,
                    child: TextButton(
                        onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                          width:
                                              SizeConfig.width *
                                                  0.3,
                                          height:
                                              SizeConfig.height *
                                                  0.3,
                                          child: AccessLocationDetailView(id: null, buildContext: context,)),
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
                    DataCell(Text(element.name!)),
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
                                              SizeConfig.width *
                                                  0.3,
                                          height:
                                              SizeConfig.height *
                                                  0.3,
                                          child: AccessLocationDetailView(id: element.id!, buildContext: context,)),
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
