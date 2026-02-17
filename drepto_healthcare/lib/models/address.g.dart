// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    _ShippingAddress(
      houseNo: json['houseNo'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      pincode: json['pincode'] as String,
      contactNumber: json['contactNumber'] as String,
      buildingName: json['buildingName'] as String?,
      landmark: json['landmark'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(_ShippingAddress instance) =>
    <String, dynamic>{
      'houseNo': instance.houseNo,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'contactNumber': instance.contactNumber,
      'buildingName': instance.buildingName,
      'landmark': instance.landmark,
      'userId': instance.userId,
      'id': instance.id,
    };
