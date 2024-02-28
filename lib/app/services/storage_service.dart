import 'dart:convert';

import 'package:emojitest/app/models/emojiModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage box;

  Future<StorageService> init() async {
    await GetStorage.init(StorageKeysHelper.containerName.name);
    box = GetStorage(StorageKeysHelper.containerName.name);
    return this;
  }

  Future<void> writeSettings(EmojiModel data) async {
    var json = data.toJson();
    var string = jsonEncode(json);
    await box.write(StorageKeysHelper.emojiStorageKey.name, data);
  }

  EmojiModel? readSettings() {
    var string = box.read(StorageKeysHelper.emojiStorageKey.name);
    if (string == null) return null;
    var json = jsonDecode(string);
    var data = EmojiModel.fromJson(json);
    return data;
  }
}

enum StorageKeysHelper {
  containerName,
  emojiStorageKey,
}
