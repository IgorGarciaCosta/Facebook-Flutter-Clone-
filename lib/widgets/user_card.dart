import 'package:flutter/material.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
