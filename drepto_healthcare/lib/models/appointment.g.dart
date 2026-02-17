// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
      appointmentId: json['appointmentId'] as String,
      status: json['status'] as String,
      userId: json['userId'] as String?,
      patientName: json['patientName'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      symptoms: json['symptoms'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      nurseId: json['nurseId'] as String?,
      nurseName: json['nurseName'] as String?,
      nurseSpecialization: json['nurseSpecialization'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      transactionId: json['transactionId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      doctorId: json['doctorId'] as String?,
      doctorName: json['doctorName'] as String?,
      specialty: json['specialty'] as String?,
      hospitalName: json['hospitalName'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      type: $enumDecodeNullable(_$AppointmentTypeEnumMap, json['type']),
      zoomLink: json['zoomLink'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'status': instance.status,
      'userId': instance.userId,
      'patientName': instance.patientName,
      'address': instance.address,
      'mobileNumber': instance.mobileNumber,
      'symptoms': instance.symptoms,
      'date': instance.date,
      'time': instance.time,
      'nurseId': instance.nurseId,
      'nurseName': instance.nurseName,
      'nurseSpecialization': instance.nurseSpecialization,
      'paymentMethod': instance.paymentMethod,
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'doctorId': instance.doctorId,
      'doctorName': instance.doctorName,
      'specialty': instance.specialty,
      'hospitalName': instance.hospitalName,
      'dateTime': instance.dateTime?.toIso8601String(),
      'type': _$AppointmentTypeEnumMap[instance.type],
      'zoomLink': instance.zoomLink,
      'location': instance.location,
    };

const _$AppointmentTypeEnumMap = {
  AppointmentType.online: 'online',
  AppointmentType.inPerson: 'inPerson',
};
