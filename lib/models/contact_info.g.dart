// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      picture: json['picture'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      jobSearch: json['jobSearch'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      driverLicence: json['driverLicence'] as bool,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
      web: json['web'] as String?,
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'picture': instance.picture,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'jobSearch': instance.jobSearch,
      'address': instance.address,
      'driverLicence': instance.driverLicence,
      'mail': instance.mail,
      'phone': instance.phone,
      'web': instance.web,
    };
