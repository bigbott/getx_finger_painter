import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingController extends GetxController {
  
  late PainterController painterController;

  @override
  void onInit() {
    painterController = PainterController()
    ..setPenType(PenType.pencil)
    ..setStrokeColor(Colors.black)
    ..setMinStrokeWidth(3)
    ..setMaxStrokeWidth(10)
    ..setBlurSigma(0.0)
    ..setBlendMode(BlendMode.colorBurn);
    
    super.onInit();
  }
}
