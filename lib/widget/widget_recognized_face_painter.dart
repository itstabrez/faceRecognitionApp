import 'package:face_recognition_using_flutter/ML/Recognition.dart';
import 'package:flutter/material.dart';

class RecognizedFacePainter extends CustomPainter {
  List<Recognition> facesList;
  dynamic imageFile;
  RecognizedFacePainter({
    required this.facesList,
    required this.imageFile,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }

    Paint p = Paint();
    p.color = Colors.red;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 3;

    for (Recognition face in facesList) {
      canvas.drawRect(face.location, p);
      TextSpan textSpan = TextSpan(
          text: face.name,
          style: const TextStyle(fontSize: 30, color: Colors.white));
      TextPainter tp =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(face.location.left, face.location.top));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
