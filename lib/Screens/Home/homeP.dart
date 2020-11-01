import 'package:flutter/material.dart';
import 'package:time_capsule/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:time_capsule/data.dart';

class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MainAppBar(),
        ),
        body: Container(
          child: Swiper(
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
                              child: Image.network(
                                home[index].image,
                                height: 320,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Icon(Icons.person),
                              Text(home[index].name),
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
      ),
    );
  }
}

