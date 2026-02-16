// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
      id: json['id'] as String,
      doctorId: json['doctorId'] as String,
      doctorName: json['doctorName'] as String,
      specialty: json['specialty'] as String,
      hospitalName: json['hospitalName'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      type: $enumDecode(_$AppointmentTypeEnumMap, json['type']),
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.upcoming,
      zoomLink: json['zoomLink'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'doctorName': instance.doctorName,
      'specialty': instance.specialty,
      'hospitalName': instance.hospitalName,
      'dateTime': instance.dateTime.toIso8601String(),
      'type': _$AppointmentTypeEnumMap[instance.type]!,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'zoomLink': instance.zoomLink,
      'location': instance.location,
    };

const _$AppointmentTypeEnumMap = {
  AppointmentType.online: 'online',
  AppointmentType.inPerson: 'inPerson',
};

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.upcoming: 'upcoming',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.cancelled: 'cancelled',
};
