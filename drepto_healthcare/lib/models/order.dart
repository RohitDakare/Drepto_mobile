import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum OrderType {
  pharmacy,
  labTest,
}

enum OrderStatus {
  processing,
  outForDelivery,
  delivered,
  cancelled,
  scheduled,
  completed,
}

@freezed
abstract class OrderItem with _$OrderItem {
  const OrderItem._();

  const factory OrderItem({
    required String name,
    required int quantity,
    required double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class Order with _$Order {
  const Order._();

  const factory Order({
    required String id,
    required OrderType type,
    required List<OrderItem> items,
    required OrderStatus status,
    required DateTime date,
    required double total,
    String? trackingId,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  // Mock data generator
  static List<Order> getMockOrders() {
    final now = DateTime.now();
    return [
      Order(
        id: 'ORD-001',
        type: OrderType.pharmacy,
        items: [
          const OrderItem(name: 'Paracetamol 500mg', quantity: 2, price: 5.0),
          const OrderItem(name: 'Vitamin C', quantity: 1, price: 12.0),
        ],
        status: OrderStatus.outForDelivery,
        date: now.subtract(const Duration(hours: 4)),
        total: 22.0,
        trackingId: 'TRK123456789',
      ),
      Order(
        id: 'LAB-002',
        type: OrderType.labTest,
        items: [
          const OrderItem(
              name: 'Complete Blood Count', quantity: 1, price: 45.0),
          const OrderItem(name: 'Lipid Profile', quantity: 1, price: 60.0),
        ],
        status: OrderStatus.scheduled,
        date: now.add(const Duration(days: 1)),
        total: 105.0,
      ),
      Order(
        id: 'ORD-003',
        type: OrderType.pharmacy,
        items: [
          const OrderItem(name: 'Amoxicillin', quantity: 1, price: 15.0),
        ],
        status: OrderStatus.delivered,
        date: now.subtract(const Duration(days: 5)),
        total: 15.0,
      ),
    ];
  }
}

extension OrderX on Order {
  // Helper to get item count description
  String get itemsDescription {
    if (items.isEmpty) return 'No items';
    if (items.length == 1) return items.first.name;
    return '${items.first.name} + ${items.length - 1} more';
  }
}
