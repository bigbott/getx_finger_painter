import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_finger_painter/app/modules/drawing/widgets/controls.dart';

import 'drawing_controller.dart';

class DrawingView extends GetView<DrawingController> {
  const DrawingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Painter'),
        centerTitle: true,
         leading: BackButton(
          onPressed: () {
            controller.painterController
                .clearContent(clearColor: const Color(0xfff0f0ff));
                Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Painter(
                key: GlobalKey(),
                controller: controller.painterController,
                backgroundColor: Colors.green.withOpacity(0.4),
                size: const Size(double.infinity, 300),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                    child: Controls(
                  pc: controller.painterController,
                  imgBytesList: controller.painterController.getImageBytes(),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
