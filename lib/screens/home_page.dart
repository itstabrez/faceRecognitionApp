import 'package:face_recognition_using_flutter/screens/register_screen.dart';
import 'package:face_recognition_using_flutter/screens/recognize_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Recognition App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/face.png",
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - 30, 50),
                backgroundColor: Colors.blue[100],
              ),
              child: const Text("Register Image"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecognitionScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth - 30, 50),
                  backgroundColor: Colors.blue[100]),
              child: const Text("Recognize Image"),
            )
          ],
        ),
      ),
    );
  }
}
