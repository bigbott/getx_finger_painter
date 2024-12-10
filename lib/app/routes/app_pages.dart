import 'package:get/get.dart';

import '../modules/connecting/connecting_binding.dart';
import '../modules/connecting/connecting_view.dart';
import '../modules/drawing/drawing_binding.dart';
import '../modules/drawing/drawing_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DRAWING,
      page: () => const DrawingView(),
      binding: DrawingBinding(),
    ),
    GetPage(
      name: _Paths.CONNECTING,
      page: () => const ConnectingView(),
      binding: ConnectingBinding(),
    ),
  ];
}
