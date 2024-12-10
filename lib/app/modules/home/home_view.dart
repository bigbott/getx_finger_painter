import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_finger_painter/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () { 
                Get.toNamed(Routes.DRAWING);
               },
              child: Text(
                'Custom Painter',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 40,),
             ElevatedButton(
              onPressed: () { 
                Get.toNamed(Routes.CONNECTING);
               },
              child: Text(
                'Connecting objects',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
