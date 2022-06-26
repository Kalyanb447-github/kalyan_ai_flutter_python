import 'package:get/get.dart';

import '../controllers/frout_and_vagetables_controller.dart';

class fruitAndvegetablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<fruitAndvegetablesController>(
      () => fruitAndvegetablesController(),
    );
  }
}
