import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/input_text.dart';

void main() => runApp(const EmployeeDetailView());

class EmployeeDetailView extends StatelessWidget {
  const EmployeeDetailView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(body: const MyStatelessWidget()),
    );
  }
}

var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Çalışan",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
                          TextEditingController(text: "test-name"))),
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "Soyad",
                      textEditingController:
                          TextEditingController(text: "test-surname"))),
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
                          TextEditingController(text: "test@test.com"))),
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "Secret",
                      textEditingController:
                          TextEditingController(text: "sajgsdajt4241"))),
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
                          TextEditingController(text: "21.31.31"))),
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "Başlangıç Tarihi",
                      textEditingController:
                          TextEditingController(text: "31.31.3131"))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft, child: Text("Departman")),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                        iconColor: Theme.of(context).colorScheme.primary,
                        prefixIcon: Icon(Icons.work)),
                    isExpanded: true,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: null),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.centerLeft, child: Text("Pozisyon")),
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
                              groupValue: "isManager",
                              onChanged: null),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: RadioListTile(
                              title: Text("Çalışan"),
                              value: false,
                              groupValue: "isManager",
                              onChanged: null),
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
                      tittle: "Başlangıç Tarihi",
                      textEditingController:
                          TextEditingController(text: "31.31.3131"))),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Departman")),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              iconColor: Theme.of(context).colorScheme.primary,
                              prefixIcon: Icon(Icons.work)),
                          isExpanded: true,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: null),
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
                                            width: 1, color: Colors.grey)),
                                    iconColor:
                                        Theme.of(context).colorScheme.primary,
                                    prefixIcon: Icon(Icons.work)),
                                isExpanded: true,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: null),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left:4.0, bottom: 2.0),
                              height: 50,
                              child: TextButton(
                                  onPressed: null,
                                  child: Text("Ekle",
                                      style: TextStyle(color: Colors.white)),
                                  style: TextButton.styleFrom(backgroundColor:Color.fromARGB(255, 55, 107, 251))),
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
                rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Text('test-site-1')),
                DataCell(Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.close))
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ))
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('2')),
                DataCell(Text('test-site-2')),
                DataCell(Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.close))
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ))
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('3')),
                DataCell(Text('test-site-3')),
                DataCell(Row(
                  children: [
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.close))
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ))
              ],
            )
                ],
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
      ),
    );
  }
}
