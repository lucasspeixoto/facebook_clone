import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/profile_image.dart';
import 'package:flutter/material.dart';

class ProfileImageButton extends StatelessWidget {
  final User user;

  final VoidCallback onTap;

  const ProfileImageButton({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileImage(urlImage: user.urlImage),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              user.name,
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
