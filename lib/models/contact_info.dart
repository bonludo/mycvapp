import 'package:json_annotation/json_annotation.dart';
import 'address.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo {
  String? picture;
  String? firstName;
  String? lastName;
  String? jobSearch;
  Address? address;
  bool driverLicence;
  String? mail;
  String? phone;
  String? web;

  ContactInfo(
      {this.picture,
      this.firstName,
      this.lastName,
      this.jobSearch,
      this.address,
      required this.driverLicence,
      this.mail,
      this.phone,
      this.web});

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);
}
