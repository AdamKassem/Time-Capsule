import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';

class MainAppBar extends StatelessWidget {
  // const MainAppBar({
  //   Key key,
  // }) : super(key: key);

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
          onPressed: () {},
        ),
      ],
    );
  }
}

class AppBarProfile extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.settings),
        iconSize: 30,
        color: Colors.blue,
        onPressed: () async{
          await _auth.signOut();
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
          onPressed: () {},
        ),
      ],
    );
  }
}


class DataSearch extends SearchDelegate<String>{

  final cities = ["Charlie","Max", "Buddy", "Oscar","Milo","Toby","Jack"];

  final recentCities = ["Max"];

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
    final suggestionList = query.isEmpty ? recentCities : cities.where((p) => p.startsWith(query)).toList();
    return suggestionList.isEmpty ? Text("No Results Found") : ListView.builder(
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