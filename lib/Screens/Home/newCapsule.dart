import 'package:flutter/material.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class NewCapsule extends StatefulWidget {
  @override
  _NewCapsuleState createState() => _NewCapsuleState();
}

class _NewCapsuleState extends State<NewCapsule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create a New Capsule",
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            color: Colors.grey[800],
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue,
        ),
      ),
    );
  }
}




