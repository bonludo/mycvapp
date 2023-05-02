// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      startYears: json['startYears'] as int,
      endYears: json['endYears'] as int,
      courseName: json['courseName'] as String,
      schoolLevel: json['schoolLevel'] as String,
      placeOfStudy: json['placeOfStudy'] as String,
      descriptionOfStudy: json['descriptionOfStudy'] as String,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'startYears': instance.startYears,
      'endYears': instance.endYears,
      'courseName': instance.courseName,
      'schoolLevel': instance.schoolLevel,
      'placeOfStudy': instance.placeOfStudy,
      'descriptionOfStudy': instance.descriptionOfStudy,
    };
