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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.IMAGE_DETECTAION);
              },
              child: Text('Image Detection'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CAT_AND_DOG);
              },
              child: Text('Cat and dog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.FLOWERS);
              },
              child: Text('Flowers'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.fruit_AND_vegetables);
              },
              child: Text('Fruit and vegetables'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.FIND_YOUR_EMOTION);
              },
              child: Text('Find your emotion'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.IMAGE_TO_TEXT);
              },
              child: Text('Image to text'),
            ),
          ],
        ),
      ),
    );
  }
}
