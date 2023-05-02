import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable()
class Education {
  Education({
    required this.startYears,
    required this.endYears,
    required this.courseName,
    required this.schoolLevel,
    required this.placeOfStudy,
    required this.descriptionOfStudy,
  });

  late final int startYears;
  late final int endYears;
  late final String courseName;
  late final String schoolLevel;
  late final String placeOfStudy;
  late final String descriptionOfStudy;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
