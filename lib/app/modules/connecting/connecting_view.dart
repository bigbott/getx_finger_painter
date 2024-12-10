import 'package:finger_painter/finger_painter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'connecting_controller.dart';

class ConnectingView extends GetView<ConnectingController> {
  const ConnectingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connecting Objects'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            controller.painterController
                ?.clearContent(clearColor: Colors.transparent);
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GetBuilder<ConnectingController>(
                  id: 'text',
                  builder: (controller) {
                    return Text(
                      controller.text,
                      style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Georgia',
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              GetBuilder<ConnectingController>(
                  id: 'letters',
                  builder: (controller) {
                    return Painter(
                      controller: controller.painterController,
                      backgroundColor: Colors.green.withOpacity(0),
                      size: const Size(double.infinity, 300),
                      onDrawingEnded: (imgBytes) {
                        controller.onDrawingEnded();
                      },
                      child: Column(
                        key: controller.columnKey,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'A',
                            style: TextStyle(fontSize: 50),
                            key: controller.aKey,
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'N',
                                style: TextStyle(fontSize: 50),
                                key: controller.nKey,
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Text(
                                'T',
                                style: TextStyle(fontSize: 50),
                                key: controller.tKey,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.clear();
                            },
                            child: Text(
                              'Clear',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
