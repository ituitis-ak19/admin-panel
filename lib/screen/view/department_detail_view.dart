import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/input_text.dart';

void main() => runApp(const DepartmentDetailView());

class DepartmentDetailView extends StatelessWidget {
  const DepartmentDetailView({super.key});

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
              child: Text("Departman",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "Departman Adı",
                      textEditingController:
                          TextEditingController(text: "test-name"))),
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "Departman Yöneticisi",
                      textEditingController:
                          TextEditingController(text: "test-surname"))),
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
                        child: Text("Yönetici")),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text("İmzalayacak Yöneticiler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.30,
            height: MediaQuery.of(context).size.height * 0.18,
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
                          IconButton(onPressed: null, icon: Icon(Icons.close))
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
                          IconButton(onPressed: null, icon: Icon(Icons.close))
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
                          IconButton(onPressed: null, icon: Icon(Icons.close))
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
