enum UserRole {
  patient,
  doctor,
  nurse,
  pharmacy,
  admin,
}

class UserModel {
  final String id;
  final String email;
  final String name;
  final UserRole role;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime? dateOfBirth;
  final String? address;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  
  // Health stats
  final String? weight; // in kg
  final String? height; // in cm
  final String? bloodType; // e.g., "O+", "A-"

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.phoneNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.address,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    required this.createdAt,
    this.lastLoginAt,
    this.weight,
    this.height,
    this.bloodType,
  });

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.patient,
      ),
      phoneNumber: json['phoneNumber'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'] as String)
          : null,
      address: json['address'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] != null
          ? DateTime.parse(json['lastLoginAt'] as String)
          : null,
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      bloodType: json['bloodType'] as String?,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.name,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'address': address,
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'createdAt': createdAt.toIso8601String(),
      'lastLoginAt': lastLoginAt?.toIso8601String(),
      'weight': weight,
      'height': height,
      'bloodType': bloodType,
    };
  }

  // Copy with method for updates
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    UserRole? role,
    String? phoneNumber,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? address,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    String? weight,
    String? height,
    String? bloodType,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodType: bloodType ?? this.bloodType,
    );
  }

  // Get display role name
  String get roleDisplayName {
    switch (role) {
      case UserRole.patient:
        return 'Patient';
      case UserRole.doctor:
        return 'Doctor';
      case UserRole.nurse:
        return 'Nurse';
      case UserRole.pharmacy:
        return 'Pharmacy Staff';
      case UserRole.admin:
        return 'Administrator';
    }
  }
}
