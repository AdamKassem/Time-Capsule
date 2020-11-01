class HomeInfo {
  final int position;
  final String name;
  final String image;
  final String caption;

  HomeInfo(
      this.position, {
      this.name,
      this.image,
      this.caption,
    });
}

List<HomeInfo> home = [
  HomeInfo(1,
    name: 'Max',
    image: 'https://res.cloudinary.com/acmtimecapsule/image/upload/v1604251475/unelvhvauunheqm5utfq.jpg',
    caption:
    "caption",
  ),
  HomeInfo(2,
    name: 'Charlie',
    image: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
    caption:
    "caption",
  ),
  HomeInfo(3,
    name: 'Oscar',
    image: 'https://images.unsplash.com/photo-1518780664697-55e3ad937233?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
    caption:
    "caption",
  ),
];

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

