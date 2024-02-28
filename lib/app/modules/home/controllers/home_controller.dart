import 'dart:ffi';

import 'package:emojitest/app/data/emoji_data.dart';
import 'package:emojitest/app/models/emojiModel.dart';
import 'package:emojitest/app/services/user_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var _userService = Get.find<UserService>();

  var activeIndex = 0.obs;
  var emojiList = EmojiData.emojiList.obs;

  EmojiModel get getActiveEmoji {
    return EmojiModel(data: emojiList[activeIndex.value]);
  }

  changeActiveIndex() {
    if (activeIndex + 1 < emojiList.length) {
      activeIndex.value++;
    } else {
      activeIndex.value = 0;
    }
    print(activeIndex.value);
  }

  initializeIndex() {
    var storedData = _userService.userData;
    print("INIT $storedData");
    activeIndex.value = emojiList.indexOf(storedData?.data);
  }

  @override
  void onInit() {
    super.onInit();
    initializeIndex();
  }
}
