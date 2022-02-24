import 'package:facebook/utils/palettes.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatelessWidget {
  final List<IconData> icons;

  final int selectedTabIndex;

  final Function(int) onTap;

  const NavigationTabs({
    Key? key,
    required this.icons,
    required this.selectedTabIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(color: PalettesColors.blueFacebook, width: 3),
        ),
      ),
      tabs: icons
          .asMap()
          .map((index, icon) {
            return MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: selectedTabIndex == index
                      ? PalettesColors.blueFacebook
                      : Colors.black54,
                  size: 30,
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
