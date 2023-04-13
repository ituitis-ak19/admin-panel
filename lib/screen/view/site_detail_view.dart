import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:admin_ui/screen/service/site_service.dart';
import 'package:admin_ui/screen/viewModel/site_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../../core/widgets/input_text.dart';

class SiteDetailView extends StatelessWidget {
  final int? id;
  const SiteDetailView({super.key, this.id});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    SiteDetailViewModel viewModel = SiteDetailViewModel(SiteService(networkManager: NetworkManager()), id);
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(body: MyStatelessWidget(viewModel: viewModel)),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final SiteDetailViewModel viewModel;
  const MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(
        builder: (_) {
          switch (viewModel.dataState) {
          case DataState.LOADING:
            return Center(child: CircularProgressIndicator());
          case DataState.ERROR:
            return Center(
                child: Text("Alan Detayı görüntülenirken bir hata oluştu"));
          case DataState.READY:
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Alan",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              ),
               ProfileCard(
                          icon: Icon(Icons.person),
                          tittle: "Alan  Adı",
                          textEditingController:
                              viewModel.textEditingControllerList[0]),
              Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: TextButton(
                              onPressed: ()=>viewModel.updateSite(),
                              child: Text("Kaydet", style: TextStyle(color: Colors.white)),
                              style:
                                  TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 55, 107, 251))),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: TextButton(
                              onPressed: null,
                              child: Text("İptal", style: TextStyle(color: Colors.white)),
                              style:
                                  TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 55, 107, 251))),
                        ),
                ),
              ],
            )
            ],
          );
        }}
      ),
    );
  }
}
