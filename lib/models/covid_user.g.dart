// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidUser _$CovidUserFromJson(Map<String, dynamic> json) => CovidUser(
      omang: json['omang'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      physicalAddress: json['physicalAddress'] as String,
      role: json['role'] as String?,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CovidUserToJson(CovidUser instance) => <String, dynamic>{
      'omang': instance.omang,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'physicalAddress': instance.physicalAddress,
      'role': instance.role,
      'userId': instance.userId,
    };
