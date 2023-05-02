// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkExperience _$WorkExperienceFromJson(Map<String, dynamic> json) =>
    WorkExperience(
      startYears: json['startYears'] as int,
      endYears: json['endYears'] as int,
      jobName: json['jobName'] as String,
      employer: json['employer'] as String,
      descriptionExperience: json['descriptionExperience'] as String,
    );

Map<String, dynamic> _$WorkExperienceToJson(WorkExperience instance) =>
    <String, dynamic>{
      'startYears': instance.startYears,
      'endYears': instance.endYears,
      'jobName': instance.jobName,
      'employer': instance.employer,
      'descriptionExperience': instance.descriptionExperience,
    };
