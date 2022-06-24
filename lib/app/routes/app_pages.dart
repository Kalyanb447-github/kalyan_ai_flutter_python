import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_detectaion/bindings/image_detectaion_binding.dart';
import '../modules/image_detectaion/views/image_detectaion_view.dart';

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
      name: _Paths.IMAGE_DETECTAION,
      page: () => const ImageDetectaionView(),
      binding: ImageDetectaionBinding(),
    ),
  ];
}
