import 'package:facebook/utils/palettes.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            centerTitle: false,
            title: Text(
              'Facebook',
              style: TextStyle(
                color: PalettesColors.blueFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircleButton(
                icon: Icons.search,
                size: 30,
                onPressed: null,
              ),
              CircleButton(
                icon: LineIcons.facebookMessenger,
                size: 30,
                onPressed: null,
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.green,
              height: 2000,
            ),
          ),
        ],
      ),
    );
  }
}
