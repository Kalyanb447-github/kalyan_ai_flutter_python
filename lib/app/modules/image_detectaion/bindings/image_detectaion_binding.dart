import 'package:get/get.dart';

import '../controllers/image_detectaion_controller.dart';

class ImageDetectaionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageDetectaionController>(
      () => ImageDetectaionController(),
    );
  }
}
