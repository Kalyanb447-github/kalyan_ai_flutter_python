import 'package:get/get.dart';

import '../modules/cat_and_dog/bindings/cat_and_dog_binding.dart';
import '../modules/cat_and_dog/views/cat_and_dog_view.dart';
import '../modules/find_your_emotion/bindings/find_your_emotion_binding.dart';
import '../modules/find_your_emotion/views/find_your_emotion_view.dart';
import '../modules/flowers/bindings/flowers_binding.dart';
import '../modules/flowers/views/flowers_view.dart';
import '../modules/frout_and_vagetables/bindings/frout_and_vagetables_binding.dart';
import '../modules/frout_and_vagetables/views/frout_and_vagetables_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_detectaion/bindings/image_detectaion_binding.dart';
import '../modules/image_detectaion/views/image_detectaion_view.dart';
import '../modules/image_to_text/bindings/image_to_text_binding.dart';
import '../modules/image_to_text/views/image_to_text_view.dart';

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
    GetPage(
      name: _Paths.CAT_AND_DOG,
      page: () => const CatAndDogView(),
      binding: CatAndDogBinding(),
    ),
    GetPage(
      name: _Paths.FLOWERS,
      page: () => const FlowersView(),
      binding: FlowersBinding(),
    ),
    GetPage(
      name: _Paths.fruit_AND_vegetables,
      page: () => const fruitAndvegetablesView(),
      binding: fruitAndvegetablesBinding(),
    ),
    GetPage(
      name: _Paths.FIND_YOUR_EMOTION,
      page: () => const FindYourEmotionView(),
      binding: FindYourEmotionBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_TO_TEXT,
      page: () => ImageToTextView(),
      binding: ImageToTextBinding(),
    ),
  ];
}
