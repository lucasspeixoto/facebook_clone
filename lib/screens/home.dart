import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/utils/palettes.dart';
import 'package:facebook/utils/responsive.dart';
import 'package:facebook/widgets/circle_button.dart';
import 'package:facebook/widgets/contacts_list.dart';
import 'package:facebook/widgets/options_list.dart';
import 'package:facebook/widgets/post_area.dart';
import 'package:facebook/widgets/post_card.dart';
import 'package:facebook/widgets/story.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeMobile(scrollController: _scrollController),
          /* tablet: HomeTablet(), */
          desktop: HomeDesktop(scrollController: _scrollController),
        ),
      ),
    );
  }
}

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              user: userActual,
              stories: stories,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: PostArea(user: userActual),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Post post = posts[index];
              return PostCard(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeDesktop({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: OptionsList(user: userActual),
          ),
        ),
        const Spacer(), //Espaçamento entre Flexibes
        Flexible(
          flex: 4,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: StoryArea(
                    user: userActual,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: PostArea(user: userActual),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Post post = posts[index];
                    return PostCard(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ContactsList(users: usersOnline),
          ),
        ),
      ],
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: Text(
            'facebook',
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
          child: PostArea(user: userActual),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              user: userActual,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Post post = posts[index];
              return PostCard(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}
