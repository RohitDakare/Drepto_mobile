import 'package:drepto_healthcare/models/payment.dart';

abstract class IPaymentRepository {
  Future<void> createOrder(PaymentRecord paymentRecord);
  Future<void> recordTransaction(RazorpayTransaction transaction);
  Future<void> updatePaymentStatus(String transactionId, String status);
  Future<List<Map<String, dynamic>>> getPaymentsForUser();
  Future<Map<String, dynamic>> getPaymentDetails(String id);
}
