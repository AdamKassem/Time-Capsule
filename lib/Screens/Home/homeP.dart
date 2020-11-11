import 'package:flutter/material.dart';
import 'package:image_collage_widget/image_collage_widget.dart';
import 'package:image_collage_widget/utils/CollageType.dart';
import 'package:time_capsule/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:time_capsule/data.dart';


class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  List<HomeInfo> home = [
    HomeInfo(position: 1,
      name: 'Max',
      image: '',
      caption:
      "caption",
      liked: false,
      likedNum: "0",
      template: true,
    ),
    HomeInfo(position: 2,
      name: 'Charlie',
      image: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
      caption:
      "caption",
      liked: false,
      likedNum: "5",
      template: false,
    ),
    HomeInfo(position: 3,
      name: 'Oscar',
      image: 'https://images.unsplash.com/photo-1518780664697-55e3ad937233?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80',
      caption:
      "caption",
      liked: false,
      likedNum: "39",
      template: false,
    ),
  ];

  pressed(HomeInfo G) {
    setState(() {
      G.liked = !G.liked;
      var tmp = int.parse(G.likedNum);
      G.liked ? tmp++ : tmp--;
      G.likedNum = tmp.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MainAppBar(),
        ),
        body: Swiper(
          scrollDirection: Axis.horizontal,
          itemCount: home.length,
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: new CustomLayoutOption(
              startIndex: -1,
              stateCount: 3
          ).addRotate([
            200.0/180,
            0,
            -20.0/180,
          ]).addTranslate([
            new Offset(-370.0, -40.0),
            new Offset(0.0, 0.0),
            new Offset(370.0, -40.0)
          ]),
          itemWidth: MediaQuery.of(context).size.width - 80,
          itemHeight: MediaQuery.of(context).size.height-180,
          itemBuilder: (context, index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 20, 26, 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.bookmark_border,
                            size: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: home[index].template ? ImageCollageWidget(collageType: CollageType.FourSquare,) : Image.network(
                              home[index].image,
                              height: 320,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(Icons.person),
                                Text(home[index].name),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    pressed(home[index]);
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: home[index].liked ? AssetImage("assets/images/like.png") : AssetImage("assets/images/likeBlank.png"),
                                    backgroundColor: Colors.transparent,
                                    radius: 10,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  home[index].likedNum,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(home[index].caption),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

