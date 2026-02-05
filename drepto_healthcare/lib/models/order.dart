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

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  const OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Order {
  final String id;
  final OrderType type;
  final List<OrderItem> items;
  final OrderStatus status;
  final DateTime date;
  final double total;
  final String? trackingId;

  const Order({
    required this.id,
    required this.type,
    required this.items,
    required this.status,
    required this.date,
    required this.total,
    this.trackingId,
  });

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
          const OrderItem(name: 'Complete Blood Count', quantity: 1, price: 45.0),
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
  
  // Helper to get item count description
  String get itemsDescription {
    if (items.isEmpty) return 'No items';
    if (items.length == 1) return items.first.name;
    return '${items.first.name} + ${items.length - 1} more';
  }
}
