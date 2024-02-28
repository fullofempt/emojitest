import 'package:emojitest/app/services/storage_service.dart';
import 'package:emojitest/app/services/user_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => UserService().init());
  await Get.putAsync(() => StorageService().init());
}
