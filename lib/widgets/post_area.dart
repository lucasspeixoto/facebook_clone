import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class PostArea extends StatelessWidget {
  final User user;

  const PostArea({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(user.urlImage),
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'No que você está pensando'),
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            thickness: 1.0,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Ao vivo',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Foto',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    'Sala',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
