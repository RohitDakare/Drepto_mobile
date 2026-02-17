// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentRecord _$PaymentRecordFromJson(Map<String, dynamic> json) =>
    _PaymentRecord(
      transactionId: json['transactionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      shippingMethod: json['shippingMethod'] as String,
      shippingCost: (json['shippingCost'] as num).toDouble(),
      shippingAddress: ShippingAddress.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentRecordToJson(_PaymentRecord instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'currency': instance.currency,
      'shippingMethod': instance.shippingMethod,
      'shippingCost': instance.shippingCost,
      'shippingAddress': instance.shippingAddress,
      'items': instance.items,
    };

_RazorpayTransaction _$RazorpayTransactionFromJson(Map<String, dynamic> json) =>
    _RazorpayTransaction(
      razorpayOrderId: json['razorpayOrderId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      receipt: json['receipt'] as String,
      notes: json['notes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RazorpayTransactionToJson(
        _RazorpayTransaction instance) =>
    <String, dynamic>{
      'razorpayOrderId': instance.razorpayOrderId,
      'amount': instance.amount,
      'currency': instance.currency,
      'receipt': instance.receipt,
      'notes': instance.notes,
    };
