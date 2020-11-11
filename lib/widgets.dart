import 'package:flutter/material.dart';

import 'Screens/Home/settings.dart';
import 'Screens/Home/newCapsule.dart';
import 'Screens/Home/releasePics.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MainAppBar extends StatefulWidget {

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {

  List<Asset> images = List<Asset>();

  Future<void> loadAssets() async {
    await MultiImagePicker.pickImages(
      maxImages: 5,
      materialOptions: MaterialOptions(
        actionBarTitle: "Album",
        allViewTitle: "All View",
        selectionLimitReachedText: "You can't select any more.",
      ),
      enableCamera: true,
    );
    if(mounted) {
      Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => DatePickerDemo()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.search),
        iconSize: 30,
        color: Colors.blue,
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
      ),
      title: FlutterLogo(
        size: 35,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 30,
          color: Colors.blue,
          onPressed: () {
            loadAssets();
          },
        ),
      ],
    );
  }
}

class AppBarProfile extends StatefulWidget {

  @override
  _AppBarProfileState createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {

  List<Asset> images = List<Asset>();

  Future<void> loadAssets() async {
    await MultiImagePicker.pickImages(
      maxImages: 5,
      materialOptions: MaterialOptions(
        actionBarTitle: "Album",
        allViewTitle: "All View",
        selectionLimitReachedText: "You can't select any more.",
      ),
      enableCamera: true,
    );
    if(mounted) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => DatePickerDemo()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.settings),
        iconSize: 30,
        color: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => SettingsPage()
          ));
        },
      ),
      title: FlutterLogo(
        size: 35,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 30,
          color: Colors.blue,
          onPressed: () {
            loadAssets();
          },
        ),
      ],
    );
  }
}


class DataSearch extends SearchDelegate<String>{

  final names = ["Charlie","Max", "Buddy", "Oscar","Milo","Toby","Jack"];

  final recentNames = ["Buddy"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentNames : names.where((p) => p.startsWith(query)).toList();
    return suggestionList.isEmpty ? Text("No Results Found", style: TextStyle(fontFamily: 'SourceSansPro',fontSize: 18,),) : ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: query.isEmpty ? Icon(Icons.access_time) : Icon(Icons.pets),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceSansPro',
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

}