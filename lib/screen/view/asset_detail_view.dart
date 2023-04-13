import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:admin_ui/screen/model/employee_detail.dart';
import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/constant/enum/enums.dart';
import '../../core/network/network_manager.dart';
import '../../core/widgets/input_text.dart';
import '../model/employee.dart';
import '../viewModel/asset_detail_view_model.dart';

void main() => runApp(const AssetDetailView());

class AssetDetailView extends StatelessWidget {
  final int? id;
  const AssetDetailView({super.key, this.id});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    AssetDetailViewModel viewModel = AssetDetailViewModel(AssetService(networkManager: NetworkManager()), id, EmployeeService(networkManager: NetworkManager()));
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(body: MyStatelessWidget(viewModel: viewModel)),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final AssetDetailViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

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
                child: Text("Ürün detayı görüntülenirken bir hata oluştu"));
          case DataState.READY:
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ürün",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: ProfileCard(
                          icon: Icon(Icons.person),
                          tittle: "Ürün Adı",
                          textEditingController:
                                viewModel.textEditingControllerList[0])),
                  Expanded(
                      flex: 5,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Çalışan")),
                          DropdownButtonFormField(
                            value: viewModel.assetDetail!.employeeId,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(width: 1, color: Colors.grey)),
                                  iconColor: Theme.of(context).colorScheme.primary,
                                  prefixIcon: Icon(Icons.work)),
                              isExpanded: true,
                              items:
                                  viewModel.employeeList!.map((Employee items) {
                                return DropdownMenuItem(
                                  value: items.id,
                                  child: Text(items.firstName! + " " + items.lastName!),
                                );
                              }).toList(),
                              onChanged:  (value) {
                                viewModel.assetDetail!.employeeId = value;}),
                        ],
                      ),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: ProfileCard(
                          icon: Icon(Icons.person),
                          tittle: "Veriliş Tarihi",
                          textEditingController:
                                viewModel.textEditingControllerList[1])),
                  Expanded(
                      flex: 5,
                      child: ProfileCard(
                          icon: Icon(Icons.person),
                          tittle: "Açıklama",
                          textEditingController:
                                viewModel.textEditingControllerList[2]))              
                          ]
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
                              onPressed: ()=> viewModel.updateAsset(),
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
