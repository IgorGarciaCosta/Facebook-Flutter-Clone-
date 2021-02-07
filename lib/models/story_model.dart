import 'package:meta/meta.dart';
import 'package:myapp/models/models.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;//to see if the story is viewed or not

  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}