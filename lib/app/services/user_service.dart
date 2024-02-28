import 'package:emojitest/app/data/emoji_data.dart';
import 'package:emojitest/app/models/emojiModel.dart';
import 'package:emojitest/app/services/storage_service.dart';
import 'package:get/get.dart';

import 'storage_service.dart';

class UserService extends GetxService {
  var storageService = Get.find<StorageService>();
  EmojiModel? userData;

  Future<UserService> init() async {
    var dataInStorage = storageService.readSettings();
    if (dataInStorage == null) {
      userData = await getFirstAvailableEmoji();
    }
    userData = dataInStorage;
    return this;
  }

  Future<void> saveData(EmojiModel data) async {
    userData = data;
    await storageService.writeSettings(data);
  }

  Future<EmojiModel> getFirstAvailableEmoji() async {
    await Future.delayed(const Duration(microseconds: 500));
    return EmojiModel(data: EmojiData.emojiList.first);
  }

  
}
