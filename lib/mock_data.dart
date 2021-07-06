import 'package:social_app/app/models/playback.dart';
import 'package:social_app/app/models/post.dart';
import 'package:social_app/app/models/user.dart';

final List<Post> mockVideoPosts = [
  Post(
    playback: Playback(
      url: "https://assets.mixkit.co/videos/preview/mixkit-halloween-pumpkin-basket-full-of-candy-33886-large.mp4",
    ),
    user: UserModel(
      username: 'cat_01',
      avatarUrl:
          'https://images.unsplash.com/photo-1548247416-ec66f4900b2e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=663&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url: "https://assets.mixkit.co/videos/preview/mixkit-white-flowers-in-the-breeze-1187-large.mp4",
    ),
    user: UserModel(
      username: 'cat_02',
      avatarUrl:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=518&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url: "https://assets.mixkit.co/videos/preview/mixkit-lens-focus-in-motion-2377-large.mp4",
    ),
    user: UserModel(
      username: 'cat_03',
      avatarUrl:
          'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=676&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url: "https://assets.mixkit.co/videos/preview/mixkit-a-man-doing-jumping-tricks-at-the-beach-1222-large.mp4",
    ),
    user: UserModel(
      username: 'cat_04',
      avatarUrl:
          'https://images.unsplash.com/photo-1529257414772-1960b7bea4eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-young-photographer-setting-up-his-camera-outdoors-34408-large.mp4",
    ),
    user: UserModel(
      username: 'cat_05',
      avatarUrl:
          'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-painter-depicting-an-artistic-work-on-a-canvas-5268-large.mp4",
    ),
    user: UserModel(
      username: 'cat_06',
      avatarUrl:
          'https://images.unsplash.com/photo-1511275539165-cc46b1ee89bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
];

final List<Post> mockImagePosts = [
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1583795128727-6ec3642408f8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=953&q=80",
    ),
    user: UserModel(
      username: 'cat_01_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1542652735873-fb2825bac6e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    ),
    user: UserModel(
      username: 'cat_02_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1559624989-7b9303bd9792?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1559235038-1b0fadf76f78?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    ),
    user: UserModel(
      username: 'cat_03_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=676&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1511275539165-cc46b1ee89bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    ),
    user: UserModel(
      username: 'cat_04_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1529257414772-1960b7bea4eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1536589961747-e239b2abbec2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    ),
    user: UserModel(
      username: 'cat_05_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1498100152307-ce63fd6c5424?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1574063413132-354db9f190fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80",
    ),
    user: UserModel(
      username: 'cat_06_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1511275539165-cc46b1ee89bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1579199931550-7496521679ea?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=853&q=80",
    ),
    user: UserModel(
      username: 'cat_07_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1511275539165-cc46b1ee89bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
  Post(
    playback: Playback(
      url:
          "https://images.unsplash.com/photo-1536589961747-e239b2abbec2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    ),
    user: UserModel(
      username: 'cat_08_image',
      avatarUrl:
          'https://images.unsplash.com/photo-1498100152307-ce63fd6c5424?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80',
    ),
  ),
];
