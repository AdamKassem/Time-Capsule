import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:time_capsule/Screens/Home/pages.dart';
import 'sidebar.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedItemIndex = 1;
  GlobalKey bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: getPage(selectedItemIndex),
          ),
          //SideBar(),
        ],
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.notifications,
            title: "Notifications",
          ),
          TabData(
            iconData: Icons.home,
            title: "Home",
          ),
          // TabData(
          //   iconData: Icons.add,
          //   title: "Notifications",
          // ),
          TabData(
            iconData: Icons.person,
            title: "Profile",
          ),
        ],
        initialSelection: 1,
        onTabChangedListener: (position) {
          setState(() {
            selectedItemIndex = position;
          });
        },
      ),
    );
  }
  getPage(int page){
    switch(page){
      case 0:
        return NotificationsP();
      case 1:
        return HomeP();
      default:
        return ProfileP();
    }
  }
}
