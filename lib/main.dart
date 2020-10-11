import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageUrl;

  bool isloading = false;
  Future uploadImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      isloading = true;
    });

    Dio dio = Dio();
    FormData formData = new FormData.fromMap({
      "file": await MultipartFile.fromFile(
        image.path,
      ),
      "upload_preset": "timecapsule",
      "cloud_name": "acmtimecapsule",
    });
    try {
      Response response = await dio.post((DotEnv().env['API_URL']), data: formData);

      var data = jsonDecode(response.toString());
      print(data[DotEnv().env['API_URL']]);

      setState(() {
        isloading = false;
        imageUrl = data['API_URL'];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: imageUrl == null
              ? !isloading
              ? Icon(
            Icons.person,
            size: 100,
            color: Colors.white,
          )
              : Loading(
            indicator: BallPulseIndicator(),
            size: 100.0,
            color: Colors.red,
          )
              : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => uploadImage(),
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}