import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../../core/network/network_manager.dart';
import '../service/time_off_service.dart';
import '../viewModel/time_off_view_model.dart';
import 'package:url_launcher/url_launcher.dart';


class TimeOffView extends StatelessWidget {
  const TimeOffView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    TimeOffViewModel viewModel = TimeOffViewModel(
        TimeOffService(networkManager: NetworkManager()), context);
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
                    width: MediaQuery.of(context).size.width * 0.81,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: MyStatelessWidget(
                    viewModel: viewModel,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final TimeOffViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (viewModel.dataState) {
        case DataState.LOADING:
          return Center(child: CircularProgressIndicator());
        case DataState.ERROR:
          return Center(
              child: Text("İmza sürecindeki izinler görüntülenirken bir hata oluştu"));
        case DataState.READY:
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.85,
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
                      'Soyad',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Başlangıç Tarihi',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Bitiş Tarihi',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'İzin Tipi',
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
                  .timeOffList! 
                  .map(
                    ((element) => DataRow(cells: <DataCell>[
                          DataCell(Text(element.id!.toString())),
                          DataCell(Text(element.firstName!)),
                           DataCell(Text(element.lastName!)), 
                            DataCell(Text(element.startDate!)), 
                             DataCell(Text(element.endDate!)),  
                          DataCell(Text(element.timeOffType!)),
                          DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      if(await viewModel.signTimeOff(element.id!)){
                                        viewModel.init();
                                      }
                                    },
                                    icon: Icon(Icons.check)),
                                    IconButton(
                                    onPressed: () async {
                                      Uri url = Uri(scheme: "http", host: "127.0.0.1", path: "/timeOff/document/" + element.id!.toString(), port: 8080);
                                      await launchUrl(url);
                                    },
                                    icon: Icon(Icons.print))
                              ]))
                        ])),
                  )
                  .toList(),
            )),
          );
      }
    });
  }
}
