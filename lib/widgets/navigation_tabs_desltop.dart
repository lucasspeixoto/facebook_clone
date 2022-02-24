import 'package:facebook/models/models.dart';
import 'package:facebook/utils/palettes.dart';
import 'package:facebook/widgets/navigation_tabs.dart';
import 'package:facebook/widgets/profile_image_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'circle_button.dart';

class NavigationTabsDesktop extends StatelessWidget {
  final User user;
  final List<IconData> icons;
  final int selectedTabIndex;
  final Function(int) onTap;

  const NavigationTabsDesktop({
    Key? key,
    required this.user,
    required this.icons,
    required this.selectedTabIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
              child: Text(
            'facebook',
            style: TextStyle(
              color: PalettesColors.blueFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: -1.2,
            ),
          )),
          Expanded(
            child: NavigationTabs(
              icons: icons,
              selectedTabIndex: selectedTabIndex,
              onTap: onTap,
              bottomSelectedTabIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProfileImageButton(
                  user: user,
                  onTap: () {},
                ),
                const CircleButton(
                  icon: Icons.search,
                  size: 30,
                  onPressed: null,
                ),
                const CircleButton(
                  icon: LineIcons.facebookMessenger,
                  size: 30,
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
