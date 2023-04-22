import 'package:admin_ui/screen/view/access_location_view.dart';
import 'package:admin_ui/screen/view/asset_view.dart';
import 'package:admin_ui/screen/view/dashboard_view.dart';
import 'package:admin_ui/screen/view/department_view.dart';
import 'package:admin_ui/screen/view/reader_view.dart';
import 'package:admin_ui/screen/view/site_view.dart';
import 'package:admin_ui/screen/view/time_off_type_view.dart';
import 'package:admin_ui/screen/view/time_off_view.dart';
import 'package:admin_ui/screen/viewModel/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:side_navigation/side_navigation.dart';
import 'employee_detail_view.dart';
import 'employee_view.dart';

class MainView extends StatelessWidget {
  final int? index;
  MainView({Key? key, this.index});

  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final MainViewModel viewModel = MainViewModel(selectedIndex: index == null ? 0 : index!);
    List<Widget> views = const [
    Center(
      child: DashBoardView(),
    ),
    Center(
      child: SiteView(),
    ),
    Center(
      child: AccessLocationView(),
    ),
    Center(
      child: ReaderView(),
    ),
    Center(
      child: DepartmentView(),
    ),
    Center(
      child: EmployeeView()
    ),
    Center(
      child: TimeOffTypeView(),
    ),
    Center(
      child: AssetView(),
    ),
    Center(
      child: TimeOffView(),
    )
  ];
    return SafeArea(
        child: Scaffold(
      body: Observer(
        builder: (_) {
          return Row(children: [
            /// Pretty similar to the BottomNavigationBar!
            SideNavigationBar(
              expandable: false,
              header: SideNavigationBarHeader(
                  image: Image.asset('assets/logo-white.png', width: 150,),
                  title: Text(''),
                  subtitle: Text('')),
              selectedIndex: viewModel.selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.home,
                  label: 'Ana Sayfa',
                ),
                SideNavigationBarItem(
                  icon: Icons.aspect_ratio,
                  label: 'Alanlar',
                ),
                SideNavigationBarItem(
                  icon: Icons.room,
                  label: 'Giriş Noktaları',
                ),
                SideNavigationBarItem(
                  icon: Icons.qr_code_scanner,
                  label: 'Okuyucular',
                ),
                SideNavigationBarItem(
                  icon: Icons.work,
                  label: 'Departmanlar',
                ),
                SideNavigationBarItem(
                  icon: Icons.people,
                  label: 'Çalışanlar',
                ),
                SideNavigationBarItem(
                  icon: Icons.tour,
                  label: 'İzin Tipleri',
                ),
                SideNavigationBarItem(
                  icon: Icons.computer,
                  label: 'Zimmetli Ürünler',
                ),
                SideNavigationBarItem(
                  icon: Icons.edit_document,
                  label: 'İmzalanacak İzinler',
                ),
              ],
              onTap: (value) {
                viewModel.setSelectedIndex(value);
              },
              
              theme: SideNavigationBarTheme(
                  itemTheme: SideNavigationBarItemTheme(
                    unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
                    selectedItemColor: Color.fromARGB(255, 55, 107, 251),
                    iconSize: 32.5,
                  ),
                  backgroundColor: Color.fromARGB(255, 43, 38, 77),
                  togglerTheme: const SideNavigationBarTogglerTheme(
                    expandIconColor: Color.fromARGB(255, 39, 47, 53),
                    shrinkIconColor: Color.fromARGB(255, 55, 107, 251),
                  ),
                  dividerTheme: SideNavigationBarDividerTheme.standard()),
            ),

            /// Make it take the rest of the available width
            Expanded(
              child: views.elementAt(viewModel.selectedIndex),
            )
          ]);
        }
      ),
    ));
  }
}
