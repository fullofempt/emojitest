import 'package:emojitest/app/data/emoji_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: GestureDetector(
            onTap: () => controller.changeActiveIndex(),
          child: Card(
            elevation: 5,
            shape: 
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: Center(
                child: Obx(() => Text(
                  controller.getActiveEmoji.data,
                  style: const TextStyle(fontSize: 40),
                )),
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
