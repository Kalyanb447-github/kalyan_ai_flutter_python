import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalyan_ai_flutter_python/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.IMAGE_DETECTAION);
                  },
                  child: Text('Image Detection'))
            ],
          ),
        ));
  }
}
