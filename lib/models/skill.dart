import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill {
  Skill({
    required this.typeOfSkills,
    required this.name,
    required this.hardSkill,
  });

  late final String typeOfSkills;
  late final List<String> name;
  bool hardSkill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);
}
