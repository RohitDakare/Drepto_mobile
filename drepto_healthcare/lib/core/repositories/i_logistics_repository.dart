import 'package:drepto_healthcare/models/address.dart';

abstract class ILogisticsRepository {
  Future<void> addShippingAddress(ShippingAddress address);
  Future<List<ShippingAddress>> getAllUserAddresses();
  Future<ShippingAddress> getAddressById(String id);
  Future<void> updateAddress(String id, Map<String, dynamic> data);
  Future<void> deleteAddress(String id);

  Future<void> submitContactForm(Map<String, dynamic> contactData);
  Future<List<dynamic>> getAllContactMessages();
}
