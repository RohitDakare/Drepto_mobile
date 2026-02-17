import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/address.dart';
import 'package:drepto_healthcare/core/repositories/i_logistics_repository.dart';

@LazySingleton(as: ILogisticsRepository)
class LogisticsRepository implements ILogisticsRepository {
  @override
  Future<void> addShippingAddress(ShippingAddress address) async {
    await ApiService.post('/shipping-address', data: address.toJson());
  }

  @override
  Future<List<ShippingAddress>> getAllUserAddresses() async {
    final response = await ApiService.get('/shipping-address');
    final data = response.data as List<dynamic>;
    return data.map((json) => ShippingAddress.fromJson(json)).toList();
  }

  @override
  Future<ShippingAddress> getAddressById(String id) async {
    final response = await ApiService.get('/shipping-address/$id');
    return ShippingAddress.fromJson(response.data);
  }

  @override
  Future<void> updateAddress(String id, Map<String, dynamic> data) async {
    await ApiService.post('/shipping-address/$id', data: data);
  }

  @override
  Future<void> deleteAddress(String id) async {
    // Implement delete
  }

  @override
  Future<void> submitContactForm(Map<String, dynamic> contactData) async {
    await ApiService.post('/contact', data: contactData);
  }

  @override
  Future<List<dynamic>> getAllContactMessages() async {
    final response = await ApiService.get('/contact');
    return response.data as List<dynamic>;
  }
}
