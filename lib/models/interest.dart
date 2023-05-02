import 'package:json_annotation/json_annotation.dart';

part 'interest.g.dart';

@JsonSerializable()
class Interest {
  Interest({
    required this.name,
    required this.myFavorite,
  });

  late final String name;
  late final String myFavorite;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  Map<String, dynamic> toJson() => _$InterestToJson(this);
}
