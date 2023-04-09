import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:admin_ui/screen/model/department.dart';
import 'package:admin_ui/screen/service/department_service.dart';
import 'package:admin_ui/screen/service/employee_service.dart';
import 'package:admin_ui/screen/service/site_service.dart';
import 'package:admin_ui/screen/viewModel/employee_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/constant/enum/enums.dart';
import '../../core/widgets/input_text.dart';
import '../model/site.dart';

class EmployeeDetailView extends StatelessWidget {
  final int? id;
  EmployeeDetailView({super.key, required this.id});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    EmployeeDetailViewModel viewModel = EmployeeDetailViewModel(
        EmployeeService(networkManager: NetworkManager()),
        id,
        DepartmentService(networkManager: NetworkManager()),
        SiteService(networkManager: NetworkManager()));
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(body: MyStatelessWidget(viewModel: viewModel)),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  final EmployeeDetailViewModel viewModel;
  MyStatelessWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        switch (viewModel.dataState) {
          case DataState.LOADING:
            return Center(child: CircularProgressIndicator());
          case DataState.ERROR:
            return Center(
                child: Text("Çalışanlar görüntülenirken bir hata oluştu"));
          case DataState.READY:
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Çalışan",
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
                            tittle: "Soyad",
                            textEditingController:
                                viewModel.textEditingControllerList[1])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Email",
                            textEditingController:
                                viewModel.textEditingControllerList[2])),
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Secret",
                            textEditingController:
                                viewModel.textEditingControllerList[3])),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Doğum Tarihi",
                            textEditingController:
                                viewModel.textEditingControllerList[4])),
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Başlangıç Tarihi",
                            textEditingController:
                                viewModel.textEditingControllerList[5])),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Departman")),
                      DropdownButtonFormField(
                          value: viewModel.employeeDetail!.departmentId,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              iconColor: Theme.of(context).colorScheme.primary,
                              prefixIcon: Icon(Icons.work)),
                          isExpanded: true,
                          items:
                              viewModel.departmentList!.map((Department items) {
                            return DropdownMenuItem(
                              value: items.id,
                              child: Text(items.name!),
                            );
                          }).toList(),
                          onChanged: (value) {
                            viewModel.employeeDetail!.departmentId = value;
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Pozisyon")),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RadioListTile(
                                    title: Text("Yönetici"),
                                    value: true,
                                    groupValue:
                                        viewModel.employeeDetail!.isManager,
                                    onChanged: (value) {
                                      viewModel.changeIsManager();
                                    }),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: RadioListTile(
                                    title: Text("Çalışan"),
                                    value: false,
                                    groupValue:
                                        viewModel.employeeDetail!.isManager,
                                    onChanged: (value) {
                                      viewModel.changeIsManager();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ProfileCard(
                            icon: Icon(Icons.person),
                            tittle: "Kalan İzin Günleri",
                            textEditingController:
                                viewModel.textEditingControllerList[6])),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Cinsiyet")),
                            DropdownButtonFormField(
                                value: viewModel.employeeDetail!.gender,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey)),
                                    iconColor:
                                        Theme.of(context).colorScheme.primary,
                                    prefixIcon: Icon(Icons.work)),
                                isExpanded: true,
                                items: const <DropdownMenuItem<String>>[
                                  DropdownMenuItem(
                                    value: "MALE",
                                    child: Text("Erkek"),
                                  ),
                                  DropdownMenuItem(
                                    value: "FEMALE",
                                    child: Text("Kız"),
                                  )
                                ],
                                onChanged: (value) {
                                  viewModel.employeeDetail!.gender = value;
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("İzinli Olduğu Alan")),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Container(
                                  height: 50,
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          iconColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          prefixIcon: Icon(Icons.work)),
                                      isExpanded: true,
                                      items:
                                          viewModel.siteList!.map((Site items) {
                                        return DropdownMenuItem(
                                          value: items.id,
                                          child: Text(items.name!),
                                        );
                                      }).toList(),
                                      onChanged: null),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 4.0, bottom: 2.0),
                                    height: 50,
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text("Ekle",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        style: TextButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 55, 107, 251))),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.3,
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
                      rows: viewModel.employeeDetail!
                          .siteList! // Loops through dataColumnText, each iteration assigning the value to element
                          .map(
                            ((element) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(element.id!.toString())),
                                    DataCell(
                                        Text(element.name!)), //Extracting fro
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                            onPressed: null,
                                            icon: Icon(Icons.close))
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.end,
                                    ))
                                  ],
                                )),
                          )
                          .toList(),
                    ),
                  ),
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
                            onPressed: null,
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
                            onPressed: null,
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
