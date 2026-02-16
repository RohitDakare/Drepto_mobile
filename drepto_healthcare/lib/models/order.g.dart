// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
      id: json['id'] as String,
      type: $enumDecode(_$OrderTypeEnumMap, json['type']),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      total: (json['total'] as num).toDouble(),
      trackingId: json['trackingId'] as String?,
    );

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$OrderTypeEnumMap[instance.type]!,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'total': instance.total,
      'trackingId': instance.trackingId,
    };

const _$OrderTypeEnumMap = {
  OrderType.pharmacy: 'pharmacy',
  OrderType.labTest: 'labTest',
};

const _$OrderStatusEnumMap = {
  OrderStatus.processing: 'processing',
  OrderStatus.outForDelivery: 'outForDelivery',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.scheduled: 'scheduled',
  OrderStatus.completed: 'completed',
};
