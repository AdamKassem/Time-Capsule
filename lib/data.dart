class HomeInfo {
  final int position;
  final String name;
  final String image;
  final String caption;
  bool liked;
  String likedNum;
  bool template;

  HomeInfo({
      this.position,
      this.name,
      this.image,
      this.caption,
      this.liked,
      this.likedNum,
      this.template,
    });
}

class FriendNotifs {
  final String image;
  final String name;
  final String info;

  FriendNotifs({
    this.name,
    this.image,
    this.info,
  });
}

List<FriendNotifs> friendNotifs = [
  FriendNotifs(
    image: 'assets/images/profilepic.jpg',
    name: 'Max',
    info: "sent you a friend request",
  ),
];

class LikeNotifs {
  final String image;
  final String name;
  final String info;
  final String time;

  LikeNotifs({
    this.name,
    this.image,
    this.info,
    this.time,
  });
}

List<LikeNotifs> likeNotifs = [
  LikeNotifs(
    image: 'assets/images/like.png',
    name: "Max",
    info: "liked your post",
    time: "2h",
  ),
];

class CommentNotifs {
  final String image;
  final String name;
  final String info;
  final String time;

  CommentNotifs({
    this.name,
    this.image,
    this.info,
    this.time,
  });
}

List<CommentNotifs> commentNotifs = [
  CommentNotifs(
    image: 'assets/images/comment.png',
    name: "Max",
    info: "commented on your post",
    time: "2h",
  ),

];

