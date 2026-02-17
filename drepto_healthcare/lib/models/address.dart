import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class ShippingAddress with _$ShippingAddress {
  const ShippingAddress._();

  const factory ShippingAddress({
    required String houseNo,
    required String street,
    required String city,
    required String state,
    required String country,
    required String pincode,
    required String contactNumber,
    String? buildingName,
    String? landmark,
    String? userId,
    String? id,
  }) = _ShippingAddress;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
}
