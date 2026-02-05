import 'package:drepto_healthcare/core/services/appointment_service.dart';
import 'package:drepto_healthcare/core/services/auth_service.dart';
import 'package:drepto_healthcare/core/services/order_service.dart';
import 'package:drepto_healthcare/models/appointment.dart';
import 'package:drepto_healthcare/models/order.dart';
import 'package:drepto_healthcare/models/user_model.dart';

class AdminService {
  /// aggregated activity item
  static Future<List<AdminActivityItem>> getRecentActivity() async {
    final List<AdminActivityItem> activity = [];

    // 1. Get New Users
    final users = await AuthService.getAllUsers();
    for (var user in users) {
      if (user.createdAt.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
        activity.add(AdminActivityItem(
          title: 'New User Registration',
          description: '${user.name} joined as ${user.roleDisplayName}',
          timestamp: user.createdAt,
          type: ActivityType.registration,
          relatedId: user.id,
        ));
      }
    }

    // 2. Get Recent Appointments
    final appointments = await AppointmentService.getAllAppointments();
    for (var apt in appointments) {
      activity.add(AdminActivityItem(
        title: 'Appointment ${apt.status.name}',
        description: '${apt.doctorName} with Patient',
        timestamp: apt.dateTime,
        type: ActivityType.appointment,
        relatedId: apt.id,
      ));
    }

    // 3. Get Recent Orders
    final orders = await OrderService.getAllOrders();
    for (var order in orders) {
      activity.add(AdminActivityItem(
        title: 'Order Placed',
        description: 'Order #${order.id.substring(0, 8)} - \₹${order.totalAmount}',
        timestamp: order.date,
        type: ActivityType.order,
        relatedId: order.id,
      ));
    }

    // Sort by timestamp descending
    activity.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return activity;
  }
}

enum ActivityType { registration, appointment, order }

class AdminActivityItem {
  final String title;
  final String description;
  final DateTime timestamp;
  final ActivityType type;
  final String relatedId;

  AdminActivityItem({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
    required this.relatedId,
  });
}
