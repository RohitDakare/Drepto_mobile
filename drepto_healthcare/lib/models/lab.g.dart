// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabCenter _$LabCenterFromJson(Map<String, dynamic> json) => _LabCenter(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nextAvailable: json['nextAvailable'] as String,
    );

Map<String, dynamic> _$LabCenterToJson(_LabCenter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'rating': instance.rating,
      'categories': instance.categories,
      'nextAvailable': instance.nextAvailable,
    };

_LabBooking _$LabBookingFromJson(Map<String, dynamic> json) => _LabBooking(
      id: json['id'] as String,
      labId: json['labId'] as String,
      labName: json['labName'] as String,
      testName: json['testName'] as String,
      category: json['category'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      statusLabel: json['statusLabel'] as String,
      hasResult: json['hasResult'] as bool,
      requestAttached: json['requestAttached'] as bool,
    );

Map<String, dynamic> _$LabBookingToJson(_LabBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labId': instance.labId,
      'labName': instance.labName,
      'testName': instance.testName,
      'category': instance.category,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'hasResult': instance.hasResult,
      'requestAttached': instance.requestAttached,
    };
