import 'package:facebook/widgets/profile_image_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/user.dart';
import '../utils/palettes.dart';

class OptionsList extends StatelessWidget {
  final User user;

  final List<List> _options = const [
    [LineIcons.userFriends, PalettesColors.blueFacebook, "Amigos"],
    [LineIcons.facebookMessenger, PalettesColors.blueFacebook, "Mensagens"],
    [LineIcons.flag, Colors.orange, "Páginas"],
    [LineIcons.users, PalettesColors.blueFacebook, "Grupos"],
    [Icons.storefront_outlined, PalettesColors.blueFacebook, "MarketPlace"],
    [Icons.ondemand_video, Colors.red, "Assistir"],
    [LineIcons.calendar, Colors.deepPurple, "Eventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver mais"],
  ];

  const OptionsList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 1 + _options.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: ProfileImageButton(user: user, onTap: () {}),
          );
        }
        List item = _options[index - 1];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Options(
            icon: item[0],
            color: item[1],
            text: item[2],
            onTap: () {},
          ),
        );
      },
    );
  }
}

class Options extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  const Options({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 35,
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
