import 'package:flutter/material.dart';
import 'package:time_capsule/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:time_capsule/Service/auth.dart';
import 'package:time_capsule/Models/user.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Asset {
  String identifier = 'image.jpg';

  Future<ByteData> getByteData() async => ByteData(10);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}