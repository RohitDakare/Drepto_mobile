import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/payment.dart';
import 'package:drepto_healthcare/core/repositories/i_payment_repository.dart';

@LazySingleton(as: IPaymentRepository)
class PaymentRepository implements IPaymentRepository {
  @override
  Future<void> createOrder(PaymentRecord paymentRecord) async {
    await ApiService.post('/payment/create-order',
        data: paymentRecord.toJson());
  }

  @override
  Future<void> recordTransaction(RazorpayTransaction transaction) async {
    await ApiService.post('/payment/record-transaction',
        data: transaction.toJson());
  }

  @override
  Future<void> updatePaymentStatus(String transactionId, String status) async {
    await ApiService.post('/payment/update-status', data: {
      'transactionId': transactionId,
      'status': status,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPaymentsForUser() async {
    final response = await ApiService.get('/payment');
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<Map<String, dynamic>> getPaymentDetails(String id) async {
    final response = await ApiService.get('/payment/$id');
    return response.data as Map<String, dynamic>;
  }
}
