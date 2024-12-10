import 'package:get/get.dart';

import 'connecting_controller.dart';

class ConnectingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectingController>(
      () => ConnectingController(),
    );
  }
}
