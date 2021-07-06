import 'package:social_app/app/models/playback.dart';
import 'package:social_app/app/models/user.dart';

class Post {
  UserModel? user;
  Playback? playback;

  Post({
    this.user,
    this.playback,
  }) : assert(playback != null);
}
