import 'package:drepto_healthcare/models/order.dart';

class OrderService {
  // In-memory orders list
  static final List<Order> _orders = [];

  // Initialize with some mock data if empty
  static Future<void> initialize() async {
    if (_orders.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      _orders.addAll(Order.getMockOrders());
    }
  }

  // Get recent orders
  static Future<List<Order>> getRecentOrders() async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Sort by date newest first
    _orders.sort((a, b) => b.date.compareTo(a.date));
    
    return _orders;
  }
}
