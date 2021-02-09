import 'package:flutter/material.dart';
import 'package:myapp/models/models.dart';

class PostContainer extends StatelessWidget {
final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );
  }
}