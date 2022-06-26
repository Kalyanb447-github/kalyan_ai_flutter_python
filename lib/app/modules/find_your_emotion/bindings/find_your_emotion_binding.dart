import 'package:get/get.dart';

import '../controllers/find_your_emotion_controller.dart';

class FindYourEmotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindYourEmotionController>(
      () => FindYourEmotionController(),
    );
  }
}
