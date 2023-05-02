import 'package:json_annotation/json_annotation.dart';
import 'package:mycv/models/my_story_pro.dart';

part 'professional_summary.g.dart';

@JsonSerializable()
class ProfessionalSummary {
  ProfessionalSummary({
    required this.presentation,
  });

  late final String presentation;
  late final List<MyStoryPro>? myStoryPro;

  factory ProfessionalSummary.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionalSummaryToJson(this);
}
