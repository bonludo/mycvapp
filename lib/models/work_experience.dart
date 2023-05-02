import 'package:json_annotation/json_annotation.dart';

part 'work_experience.g.dart';

@JsonSerializable()
class WorkExperience {
  WorkExperience({
    required this.startYears,
    required this.endYears,
    required this.jobName,
    required this.employer,
    required this.descriptionExperience,
  });

  late final int startYears;
  late final int endYears;
  late final String jobName;
  late final String employer;
  late final String descriptionExperience;

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkExperienceToJson(this);
}
