import 'package:freezed_annotation/freezed_annotation.dart';

part 'emojiModel.freezed.dart';
part 'emojiModel.g.dart';

@freezed
class EmojiModel with _$EmojiModel {
  factory EmojiModel({
    required String data,
  }) = _EmojiModel;

  factory EmojiModel.fromJson(Map<String, dynamic> json) =>
      _$EmojiModelFromJson(json);
}
