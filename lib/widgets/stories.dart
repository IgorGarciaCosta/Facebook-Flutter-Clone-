import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/pallete.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/models/models.dart';
import 'package:myapp/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, @required this.currentUser, @required this.stories})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 200,
        color: Colors.purple,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          scrollDirection: Axis.horizontal,
          //this +1 is because of out button to create a story
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              //se for o primeiro story card
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }

            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(story: story),
            );
          },
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard(
      {Key key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
                gradient: Palette.storyGradient,
                borderRadius: BorderRadius.circular(12)),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: isAddStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                      color: Palette.facebookBlue,
                      onPressed: () => print('Added to story'),
                    ),
                  )
                : ProfileAvatar(imageUrl: story.user.imageUrl),
          ),
        ],
      ),
    );
  }
}
