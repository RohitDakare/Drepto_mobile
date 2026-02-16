// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      hospital: json['hospital'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviews: (json['reviews'] as num).toInt(),
      patients: (json['patients'] as num).toInt(),
      about: json['about'] as String,
      imageUrl: json['imageUrl'] as String,
      availableSlots: (json['availableSlots'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      videoConsultationFee: (json['videoConsultationFee'] as num).toDouble(),
      clinicVisitFee: (json['clinicVisitFee'] as num).toDouble(),
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'hospital': instance.hospital,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'patients': instance.patients,
      'about': instance.about,
      'imageUrl': instance.imageUrl,
      'availableSlots': instance.availableSlots,
      'videoConsultationFee': instance.videoConsultationFee,
      'clinicVisitFee': instance.clinicVisitFee,
      'isOnline': instance.isOnline,
    };
