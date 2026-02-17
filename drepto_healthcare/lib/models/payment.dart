import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'order.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class PaymentRecord with _$PaymentRecord {
  const PaymentRecord._();

  const factory PaymentRecord({
    required String transactionId,
    required double amount,
    required String currency,
    required String shippingMethod,
    required double shippingCost,
    required ShippingAddress shippingAddress,
    required List<OrderItem> items,
  }) = _PaymentRecord;

  factory PaymentRecord.fromJson(Map<String, dynamic> json) =>
      _$PaymentRecordFromJson(json);
}

@freezed
abstract class RazorpayTransaction with _$RazorpayTransaction {
  const RazorpayTransaction._();

  const factory RazorpayTransaction({
    required String razorpayOrderId,
    required double amount,
    required String currency,
    required String receipt,
    Map<String, dynamic>? notes,
  }) = _RazorpayTransaction;

  factory RazorpayTransaction.fromJson(Map<String, dynamic> json) =>
      _$RazorpayTransactionFromJson(json);
}
