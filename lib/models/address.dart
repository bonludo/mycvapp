import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String street;
  final String city;
  final String state;
  final String zip;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
