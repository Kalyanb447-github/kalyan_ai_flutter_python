import 'package:get/get.dart';

import '../controllers/flowers_controller.dart';

class FlowersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlowersController>(
      () => FlowersController(),
    );
  }
}
