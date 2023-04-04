import 'package:admin_ui/screen/view/access_location_view.dart';
import 'package:admin_ui/screen/view/department_view.dart';
import 'package:admin_ui/screen/view/reader_view.dart';
import 'package:admin_ui/screen/view/site_view.dart';
import 'package:admin_ui/screen/view/time_off_type_view.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'employee_detail_view.dart';
import 'employee_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> views = const [
    Center(
      child: Text('Dashboard'),
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
    )
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Row(children: [
        /// Pretty similar to the BottomNavigationBar!
        SideNavigationBar(
          header: SideNavigationBarHeader(
              image: Image.asset('assets/logo-white.png', width: 150,),
              title: Text(''),
              subtitle: Text('')),
          selectedIndex: selectedIndex,
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
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
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
          child: views.elementAt(selectedIndex),
        )
      ]),
    ));
  }
}
