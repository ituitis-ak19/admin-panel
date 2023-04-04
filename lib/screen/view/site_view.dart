import 'package:admin_ui/screen/view/site_detail_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const SiteView());

class SiteView extends StatelessWidget {
  const SiteView({super.key});

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
            DataCell(Row(  
              children: [IconButton(onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height*0.22,
                      child: SiteDetailView()),
                  );
                });
              }, icon: Icon(Icons.navigate_next))],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('Bilal')),
            DataCell(Row(
              children: [Icon(Icons.navigate_next)],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        )
      ],
    );
  }
}
