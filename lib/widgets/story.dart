import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/utils/palettes.dart';
import 'package:facebook/utils/responsive.dart';
import 'package:facebook/widgets/profile_image.dart';
import 'package:flutter/material.dart';

class StoryArea extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const StoryArea({
    required this.user,
    required this.stories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            Story userStorie = Story(
              user: userActual,
              urlImage: userActual.urlImage,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StorieCard(story: userStorie, addStorie: true),
            );
          }

          Story story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: StorieCard(story: story),
          );
        },
      ),
    );
  }
}

class StorieCard extends StatelessWidget {
  final Story story;
  final bool addStorie;

  const StorieCard({
    required this.story,
    this.addStorie = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PalettesColors.storieDegrade,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStorie
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: PalettesColors.blueFacebook,
                  ),
                )
              : ProfileImage(
                  urlImage: story.user.urlImage,
                  visualized: story.visualized,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStorie ? "Criar Story" : story.user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
