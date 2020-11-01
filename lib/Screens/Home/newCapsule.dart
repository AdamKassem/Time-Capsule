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

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set cache as true if you don't want to make an upload call with files of the same filename
  // in such case if the filepath/identifier has already been uploaded before, you simply get the previously cached response.
  var cloudinary =
  CloudinaryPublic('acmtimecapsule', 'timecapsule', cache: false);

  // Using a file. For example, gotten from: https://pub.dev/packages/image_picker
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //File file = File('');
  CloudinaryResponse response = await cloudinary.uploadFile(
    CloudinaryFile.fromFile(image.path,
        resourceType: CloudinaryResourceType.Image),
  );

  print(response.secureUrl);

  // Using Byte Data. For example gotten from: https://pub.dev/packages/multi_image_picker
  final images = await MultiImagePicker.pickImages(maxImages: 4);

  List<CloudinaryResponse> uploadedImages = await cloudinary.multiUpload(
    images
        .map(
          (image) => CloudinaryFile.fromFutureByteData(
        image.getByteData(),
        identifier: image.identifier,
      ),
    )
        .toList(),
  );

  print(uploadedImages[0].secureUrl);
}
