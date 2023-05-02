import 'package:json_annotation/json_annotation.dart';

part 'my_story_pro.g.dart';

@JsonSerializable()
class MyStoryPro {
  int? chapter;
  String? title;
  String? text;

  MyStoryPro({required this.chapter, required this.title, required this.text});

  factory MyStoryPro.fromJson(Map<String, dynamic> json) =>
      _$MyStoryProFromJson(json);

  Map<String, dynamic> toJson() => _$MyStoryProToJson(this);
}
