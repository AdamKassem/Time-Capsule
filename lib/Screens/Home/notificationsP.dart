import 'package:flutter/material.dart';
import 'package:time_capsule/widgets.dart';
import 'package:time_capsule/data.dart';

class NotificationsP extends StatefulWidget {
  @override
  _NotificationsPState createState() => _NotificationsPState();
}

class _NotificationsPState extends State<NotificationsP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MainAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Friend Requests ",
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          " See all",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: friendNotifs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage(friendNotifs[index].image),
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                ),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      friendNotifs[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                    Text(
                                      friendNotifs[index].info,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(2),
                                  color: Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(2),
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Likes ",
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: likeNotifs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                SizedBox(width: 5),
                                CircleAvatar(
                                  backgroundImage: AssetImage(likeNotifs[index].image),
                                  backgroundColor: Colors.transparent,
                                  radius: 20,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      likeNotifs[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                    Text(
                                      likeNotifs[index].info,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              likeNotifs[index].time,
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Comments ",
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: commentNotifs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage(commentNotifs[index].image),
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                ),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      commentNotifs[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                    Text(
                                      commentNotifs[index].info,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              likeNotifs[index].time,
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
