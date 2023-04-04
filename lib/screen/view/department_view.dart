import 'package:admin_ui/screen/view/department_detail_view.dart';
import 'package:admin_ui/screen/view/employee_detail_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DepartmentView());

class DepartmentView extends StatelessWidget {
  const DepartmentView({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
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
                        child: Text("Yeni Oluştur", style: TextStyle(color: Colors.white)),
                        style:
                            TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 55, 107, 251))),
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: const MyStatelessWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Ad',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Yönetici',
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
            DataCell(Text('Bilal')),
            DataCell(Text('Ak')),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: DepartmentDetailView()),
                            );
                          });
                    },
                    icon: Icon(Icons.navigate_next))
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('test-dep-1')),
            DataCell(Text('Bilal Ak')),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: DepartmentDetailView()),
                            );
                          });
                    },
                    icon: Icon(Icons.navigate_next))
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('2')),
            DataCell(Text('test-dep-2')),
            DataCell(Text('Mehmet Oğuz Arslan')),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: DepartmentDetailView()),
                            );
                          });
                    },
                    icon: Icon(Icons.navigate_next))
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('3')),
            DataCell(Text('test-dep-3')),
            DataCell(Text('Test User')),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: DepartmentDetailView()),
                            );
                          });
                    },
                    icon: Icon(Icons.navigate_next))
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ))
          ],
        ),
      ],
    );
  }
}
