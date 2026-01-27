# Drepto App Schema Definitions

This document defines the data models and schemas used throughout the Drepto Healthcare Application. Since the application currently uses implicit models passed via widgets, this schema serves as the source of truth for future backend integration and local database implementation.

## 1. User
Represents a registered user of the application.
```dart
class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final UserRole role; // enum: patient, doctor, nurse, pharmacy
  final String? profileImage;
}
```

## 2. Doctor
Represents a medical professional.
```dart
class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String about;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final List<String> availableSlots; // e.g., ["09:00 AM", "10:00 AM"]
  final double consultationFee;
}
```

## 3. Appointment
Represents a scheduled consultation.
```dart
class Appointment {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime date;
  final String timeSlot;
  final AppointmentStatus status; // enum: upcoming, completed, cancelled
  final AppointmentType type; // enum: video, clinic_visit
  final String? meetingLink; // For video calls
}
```

## 4. Product (Medicine/Pharmacy)
Represents an item available in the pharmacy.
```dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final int? discountPercent;
  final String category; // e.g., "Pain Relief", "Antibiotics"
  final String imageUrl;
  final bool isPrescriptionRequired;
}
```

## 5. Order
Represents a purchase from the pharmacy.
```dart
class Order {
  final String id;
  final String patientId;
  final List<OrderItem> items;
  final double totalAmount;
  final OrderStatus status; // enum: pending, processing, delivered, cancelled
  final DateTime orderDate;
}

class OrderItem {
  final String productId;
  final int quantity;
  final double priceAtPurchase;
}
```

## 6. Health Record
Represents a user's medical document.
```dart
class HealthRecord {
  final String id;
  final String patientId;
  final String title;
  final String type; // e.g., "Prescription", "Lab Report"
  final DateTime date;
  final String fileUrl;
}
```

## 7. Service
Represents a dashboard service shortcut.
```dart
class AppService {
    final String title;
    final String subtitle;
    final IconData icon;
    final String route;
    final bool isEmergency;
}
```
