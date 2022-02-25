import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/utils/palettes.dart';
import 'package:facebook/utils/responsive.dart';
import 'package:facebook/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: isDesktop ? Colors.transparent : Colors.white,
      child: Card(
        margin:
            EdgeInsets.symmetric(vertical: 8, horizontal: isDesktop ? 5 : 0),
        elevation: isDesktop ? 1 : 0,
        shape: isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            : null,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              //Cabeçalho
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [PostHeader(post: post), Text(post.description)],
                ),
              ),

              //Imagem do post
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CachedNetworkImage(imageUrl: post.urlImage),
              ),

              //Área de estatisticas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Statistics(post: post),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  final Post post;
  const Statistics({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PalettesColors.blueFacebook,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              '${post.comments} comentários',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} compartilhamentos',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PostButton(
              icon: const Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey,
              ),
              text: 'Curtir',
              onTap: () {},
            ),
            PostButton(
              icon: const Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey,
              ),
              text: 'Comentar',
              onTap: () {},
            ),
            PostButton(
              icon: const Icon(
                LineIcons.share,
                color: Colors.grey,
              ),
              text: 'Compartilhar',
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const PostButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(urlImage: post.user.urlImage),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Text('${post.time} - '),
                Icon(
                  Icons.public,
                  size: 12,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ],
        )),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
