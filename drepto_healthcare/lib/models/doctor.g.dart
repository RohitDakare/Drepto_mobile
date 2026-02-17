// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
      id: json['id'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      experienceYears: (json['experienceYears'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      nextAvailable: json['nextAvailable'] as String,
      hospital: json['hospital'] as String?,
      reviews: (json['reviews'] as num?)?.toInt(),
      patients: (json['patients'] as num?)?.toInt(),
      about: json['about'] as String?,
      imageUrl: json['imageUrl'] as String?,
      availableSlots: (json['availableSlots'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      videoConsultationFee: (json['videoConsultationFee'] as num?)?.toDouble(),
      clinicVisitFee: (json['clinicVisitFee'] as num?)?.toDouble(),
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialization': instance.specialization,
      'experienceYears': instance.experienceYears,
      'rating': instance.rating,
      'nextAvailable': instance.nextAvailable,
      'hospital': instance.hospital,
      'reviews': instance.reviews,
      'patients': instance.patients,
      'about': instance.about,
      'imageUrl': instance.imageUrl,
      'availableSlots': instance.availableSlots,
      'videoConsultationFee': instance.videoConsultationFee,
      'clinicVisitFee': instance.clinicVisitFee,
      'isOnline': instance.isOnline,
    };
