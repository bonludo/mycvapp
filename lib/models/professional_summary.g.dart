// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionalSummary _$ProfessionalSummaryFromJson(Map<String, dynamic> json) =>
    ProfessionalSummary(
      presentation: json['presentation'] as String,
    )..myStoryPro = (json['myStoryPro'] as List<dynamic>?)
        ?.map((e) => MyStoryPro.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ProfessionalSummaryToJson(
        ProfessionalSummary instance) =>
    <String, dynamic>{
      'presentation': instance.presentation,
      'myStoryPro': instance.myStoryPro,
    };
