import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:admin_ui/screen/service/access_location_service.dart';
import 'package:admin_ui/screen/service/site_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../../core/widgets/input_text.dart';
import '../model/site.dart';
import '../viewModel/access_location_detail_view_model.dart';
import 'main_view.dart';

class AccessLocationDetailView extends StatelessWidget {
  final int? id;
  final BuildContext buildContext;
  AccessLocationDetailView({super.key, required this.id, required this.buildContext});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    AccessLocationDetailViewModel viewModel = AccessLocationDetailViewModel(
        AccessLocationService(networkManager: NetworkManager()),
        SiteService(networkManager: NetworkManager()),
        id, context);
        viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(body: MyStatelessWidget(viewModel: viewModel, buildContext: context,)),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final AccessLocationDetailViewModel viewModel;
  final BuildContext buildContext;
  MyStatelessWidget({super.key, required this.viewModel, required this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        switch (viewModel.dataState) {
          case DataState.LOADING:
            return Center(child: CircularProgressIndicator());
          case DataState.ERROR:
            return Center(
                child: Text("Giriş noktası detayı görüntülenirken bir hata oluştu"));
          case DataState.READY:
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Giriş Noktası",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Ad",
                            textEditingController:
                                 viewModel.textEditingControllerList[0])),
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Tip",
                            textEditingController:
                                 viewModel.textEditingControllerList[1])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft, child: Text("Alan")),
                            DropdownButtonFormField(
                                value: viewModel.accessLocationDetail!.siteId,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(width: 1, color: Colors.grey)),
                                    iconColor: Theme.of(context).colorScheme.primary,
                                    prefixIcon: Icon(Icons.work)),
                                isExpanded: true,
                                items: viewModel.siteList!.map((Site items) {
                                  return DropdownMenuItem(
                                    value: items.id,
                                    child: Text(items.name!),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  viewModel.accessLocationDetail!.siteId = value;
                                }),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Konum",
                            textEditingController:
                                 viewModel.textEditingControllerList[2])),
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
                              if (await viewModel.updateAccessLocation()) {
                                Navigator.pushReplacement(
                                    buildContext,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MainView(index: 1)));
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
