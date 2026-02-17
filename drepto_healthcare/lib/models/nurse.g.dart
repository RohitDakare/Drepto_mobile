// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nurse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Nurse _$NurseFromJson(Map<String, dynamic> json) => _Nurse(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
      gender: json['gender'] as String,
      licenseNumber: json['licenseNumber'] as String,
      role: json['role'] as String,
      specification: json['specification'] as String,
      availiability: json['availiability'] as String,
      isAvailable: json['isAvailable'] as bool,
      experienceYears: (json['experienceYears'] as num).toInt(),
      serviceTypes: (json['serviceTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$NurseToJson(_Nurse instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNumber': instance.mobileNumber,
      'gender': instance.gender,
      'licenseNumber': instance.licenseNumber,
      'role': instance.role,
      'specification': instance.specification,
      'availiability': instance.availiability,
      'isAvailable': instance.isAvailable,
      'experienceYears': instance.experienceYears,
      'serviceTypes': instance.serviceTypes,
      'id': instance.id,
      'profileImageUrl': instance.profileImageUrl,
    };
