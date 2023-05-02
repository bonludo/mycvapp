// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      typeOfSkills: json['typeOfSkills'] as String,
      name: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
      hardSkill: json['hardSkill'] as bool,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'typeOfSkills': instance.typeOfSkills,
      'name': instance.name,
      'hardSkill': instance.hardSkill,
    };
