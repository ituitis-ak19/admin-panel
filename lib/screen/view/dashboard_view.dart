import 'package:admin_ui/screen/service/asset_service.dart';
import 'package:admin_ui/screen/view/asset_detail_view.dart';
import 'package:admin_ui/core/network/network_manager.dart';
import 'package:admin_ui/core/constant/enum/enums.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../viewModel/asset_view_model.dart';


class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  static const String _title = 'Flutter Code Sample';

  static const Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    AssetViewModel viewModel = AssetViewModel(
        AssetService(networkManager: NetworkManager()));
    viewModel.init();
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                    Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                    Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                ],),
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                    Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                    Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PieChart(dataMap: dataMap)),
                ],),
            ],
          )
        ),
      ),
    );
  }
}


