import 'package:flutter/material.dart';
import 'package:time_capsule/widgets.dart';

class ProfileP extends StatefulWidget {
  @override
  _ProfilePState createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {

  final List<String> _listItem = [
    'assets/images/homefeed1.jpg','assets/images/homefeed2.jpg','assets/images/homefeed3.jpg',
    'assets/images/homefeed1.jpg','assets/images/homefeed2.jpg','assets/images/homefeed3.jpg',
    'assets/images/homefeed1.jpg','assets/images/homefeed2.jpg','assets/images/homefeed3.jpg',
    'assets/images/homefeed1.jpg','assets/images/homefeed2.jpg','assets/images/homefeed3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarProfile(),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 200,
                width: 400,
                child: Image(
                  height: 200,
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/cover.jpg'),
                ),
              ),
              Positioned(
                bottom: -70,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 12),
                        Text(
                          "NAME",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'SourceSansPro',
                            letterSpacing: .2,
                          ),
                        ),
                        Text(
                          "Bio",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'SourceSansPro',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 80,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: _listItem.map((item) => Card(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
