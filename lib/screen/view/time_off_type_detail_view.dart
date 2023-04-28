import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:admin_ui/screen/service/time_off_type_service.dart';
import 'package:admin_ui/screen/view/main_view.dart';
import 'package:admin_ui/screen/view/time_off_type_view.dart';
import 'package:admin_ui/screen/viewModel/time_off_type_detail_view_model.dart';
import 'package:admin_ui/screen/viewModel/time_off_type_view_model.dart';
import 'package:flutter/material.dart';

import 'package:admin_ui/core/network/network_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/constant/enum/enums.dart';
import '../../core/widgets/input_text.dart';
import '../viewModel/employee_detail_view_model.dart';

class TimeOffTypeDetailView extends StatelessWidget {
  final int? id;
  final BuildContext buildContext;
  const TimeOffTypeDetailView({super.key, this.id, required this.buildContext});

  static const String _title = 'İzin Tipi Detay Pop-up';

  @override
  Widget build(BuildContext context) {
    TimeOffTypeDetailViewModel viewModel = TimeOffTypeDetailViewModel(
        TimeOffTypeService(networkManager: NetworkManager()), id, context);
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(
          body: MyStatelessWidget(
        viewModel: viewModel,
        buildContext: buildContext,
      )),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final TimeOffTypeDetailViewModel viewModel;
  final BuildContext buildContext;
  MyStatelessWidget(
      {super.key, required this.viewModel, required this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        switch (viewModel.dataState) {
          case DataState.LOADING:
            return Center(child: CircularProgressIndicator());
          case DataState.ERROR:
            return Center(
                child:
                    Text("İzin tipi detayı görüntülenirken bir hata oluştu"));
          case DataState.READY:
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("İzin Tipi",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.tour),
                            tittle: "İzin Tipi Adı",
                            textEditingController:
                                viewModel.textEditingControllerList[0])),
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.description),
                            tittle: "İzin Tipi Açıklaması",
                            textEditingController:
                                viewModel.textEditingControllerList[1])),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextButton(
                            onPressed: () async {
                              if (await viewModel.updateTimeOffType()) {
                                Navigator.pushReplacement(
                                    buildContext,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MainView(index: 6)));
                              }
                            },
                            child: Text("Kaydet",
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 55, 107, 251))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.05,
                        child: TextButton(
                            onPressed: () => Navigator.of(buildContext).pop(),
                            child: Text("İptal",
                                style: TextStyle(color: Colors.white)),
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 55, 107, 251))),
                      ),
                    ),
                  ],
                )
              ],
            );
        }
      }),
    );
  }
}
