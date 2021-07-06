class UserModel {
  String? username;
  String? avatarUrl;

  UserModel({
    this.username,
    this.avatarUrl,
  }) : assert(username != null);
}
