import 'package:flutter/material.dart';
// import 'package:qrent/core/constants/routeconst/RouteConstants.dart';
// import 'package:qrent/screen/house/model/house_model.dart';
// import '../../../screen/home/view/home_view.dart';
// import '../../../screen/house/view/house_view.dart';

class RouteGenerator {
  static final RouteGenerator _instance = RouteGenerator._init();
  static RouteGenerator get instance => _instance;

  RouteGenerator._init();

void generateRoute(RouteSettings args) {
//     switch (args.name) {
//       case RouteConstants.DEFAULT:
//         return normalNavigate(HomeView(), RouteConstants.DEFAULT);

//       case RouteConstants.HOME:
//         return normalNavigate(HomeView(), RouteConstants.HOME);

//       case RouteConstants.HOUSE:
//         return normalNavigate(
//             HouseView(houseModel: args.arguments as HouseModel),
//             RouteConstants.HOUSE);
// //id: args.arguments
//       // case RouteConstants.HOUSE:
//       // return normalNavigate(HouseView(), RouteConstants.BUY_VIEW);

//       default:
//         return MaterialPageRoute(
//           builder: (context) => HomeView(),
//         );
    
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
