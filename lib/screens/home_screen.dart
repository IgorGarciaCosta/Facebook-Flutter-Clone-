import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myapp/config/pallete.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/models/models.dart';
import 'package:myapp/widgets/create_post_container.dart';
import 'package:myapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(),
          desktop: _HomeScreenDesktop(),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print("Search"),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print("Messenger"),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CratePostContainer(currentUser: currentUser),
        ),
        //OTHER USER'S PROFILE PICTURES
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        //USER'S STORIES
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        //MORE OPTIONS
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        //FEED
        Container(
          width: 600,
          color: Colors.red,
        ),
        const Spacer(),
        //CONTACTS
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
