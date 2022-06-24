import 'package:get/get.dart';

import '../controllers/cat_and_dog_controller.dart';

class CatAndDogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatAndDogController>(
      () => CatAndDogController(),
    );
  }
}
