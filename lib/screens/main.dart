import 'package:facebook/data/data.dart';
import 'package:facebook/screens/home.dart';
import 'package:facebook/utils/responsive.dart';
import 'package:facebook/widgets/navigation_tabs.dart';
import 'package:facebook/widgets/navigation_tabs_desltop.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final List<Widget> _screens = [
    const Home(),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.red),
    const Scaffold(backgroundColor: Colors.orange),
    const Scaffold(backgroundColor: Colors.purple),
    const Scaffold(backgroundColor: Colors.blue),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                preferredSize: Size(size.width, 65),
                child: NavigationTabsDesktop(
                  user: userActual,
                  icons: _icons,
                  selectedTabIndex: _selectedTabIndex,
                  onTap: (index) {
                    setState(
                      () {
                        _selectedTabIndex = index;
                      },
                    );
                  },
                ),
              )
            : null,
        body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), //Impossibilita navegar arrastando para os lados
          children: _screens,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavigationTabs(
                icons: _icons,
                selectedTabIndex: _selectedTabIndex,
                onTap: (index) {
                  setState(
                    () {
                      _selectedTabIndex = index;
                    },
                  );
                },
              ),
      ),
    );
  }
}
