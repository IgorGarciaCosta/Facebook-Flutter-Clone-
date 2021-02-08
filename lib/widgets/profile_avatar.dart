import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/pallete.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const ProfileAvatar({Key key, @required this.imageUrl, this.isActive = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      //used to make one widget overlay other
      children: <Widget>[
        CircleAvatar(
          //avatar photo
          radius: 20,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        isActive
            ? Positioned(
                //green circle
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
              )
            //that last SizedBox() erases the green circle in the main user profile photo

            : const SizedBox.shrink()
      ],
    );
  }
}
