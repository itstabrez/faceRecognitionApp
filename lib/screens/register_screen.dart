import 'dart:io';

import 'package:face_recognition_using_flutter/widget/widget_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  captureImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        doFaceDetection();
      });
    }
  }

  selectImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        doFaceDetection();
      });
    }
  }

  doFaceDetection() async {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _image != null
              ? SizedBox(
                  width: screenWidth / 1.5,
                  height: screenHeight / 2,
                  child: Image.file(_image!),
                )
              : Image.asset(
                  "assets/icons/face.png",
                  height: screenHeight / 2.8,
                  width: screenWidth / 1.5,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              roundedContainer(context,
                  child: InkWell(
                    onTap: () => selectImage(),
                    child: const Icon(
                      Icons.image,
                      size: 50.0,
                    ),
                  )),
              roundedContainer(context,
                  child: InkWell(
                    onTap: () => captureImage(),
                    child: const Icon(
                      Icons.camera,
                      size: 50.0,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
