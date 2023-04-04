import 'package:admin_ui/core/widgets/input_text2.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/input_text.dart';

void main() => runApp(const TimeOffTypeDetailView());

class TimeOffTypeDetailView extends StatelessWidget {
  const TimeOffTypeDetailView({super.key});

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
              child: Text("İzin Tipi",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "İzin Tipi Adı",
                      textEditingController:
                          TextEditingController(text: "test-name"))),
              Expanded(
                  flex: 5,
                  child: ProfileCard(
                      icon: Icon(Icons.person),
                      tittle: "İzin Tipi Açıklaması",
                      textEditingController:
                          TextEditingController(text: "test-surname"))),
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
