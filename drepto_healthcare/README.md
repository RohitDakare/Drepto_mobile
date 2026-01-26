# Drepto Healthcare - Flutter Application

A comprehensive healthcare management application built with Flutter for Android and iOS platforms. This application serves patients, doctors, nurses, and pharmacy staff with role-specific dashboards and features.

## 🏥 Features

### For Patients
- **Dashboard**: Quick access to all health services
- **Doctor Consultations**: Book appointments and video consultations
- **Pharmacy**: Browse medicines, order prescriptions, manage cart
- **Lab Tests**: Book diagnostic tests and view reports
- **Health Records**: Digital vault for prescriptions, lab reports, vaccinations
- **Ambulance Services**: Emergency ambulance booking with live tracking
- **AI Health Assistant**: 24/7 chatbot for health queries
- **Profile Management**: Health stats, settings, and preferences

### For Doctors
- **Dashboard**: Overview of today's schedule and statistics
- **Patient Management**: View patient directory and history
- **Appointments**: Manage daily appointments
- **Video Consultations**: Conduct virtual consultations
- **Prescription Tool**: Create and send digital prescriptions
- **Messages**: Communicate with patients

### For Nurses
- **Dashboard**: Daily task overview with progress tracking
- **Visit Management**: Home visit scheduling and navigation
- **Patient Care**: Track patient vitals and care tasks
- **Task Checklist**: Organized workflow for patient care
- **Team Communication**: Chat with healthcare team

## 🎨 Design System

### Color Palette
- **Primary**: #007E85 (Teal)
- **Accent**: #10B981 (Green)
- **Background Light**: #F9FAFB
- **Background Dark**: #0F2223
- **Emergency/Alert**: Red variants

### Typography
- **Font Family**: Inter (Google Fonts)
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)

### Components
- Reusable buttons (Primary, Secondary, Icon buttons)
- Input fields (Text, Search, Dropdown)
- Cards (Service, Appointment, Order, Product)
- Bottom navigation bars (role-specific)

## 📱 Screens Implemented

1. **Onboarding & Auth**
   - App Onboarding (3 slides)
   - Secure Login Portal
   - User Registration (2-step process)

2. **Dashboards**
   - Patient Dashboard
   - Doctor Dashboard
   - Nurse Dashboard

3. **Pharmacy Flow**
   - Pharmacy & Medicines
   - Shopping Cart
   - Checkout & Payment
   - Order Success Confirmation

4. **Health Services**
   - Lab Tests & Diagnostics
   - Health Records Vault
   - Request Ambulance Service
   - Live Ambulance Tracking

5. **Communication**
   - AI Health Assistant (Chat)
   - Profile & Settings

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Android Studio / VS Code
- Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd drepto_healthcare
```

2. Install dependencies:
```bash
flutter pub get
```

3. Download Inter font family and place in `fonts/` directory:
   - Inter-Regular.ttf (400)
   - Inter-Medium.ttf (500)
   - Inter-SemiBold.ttf (600)
   - Inter-Bold.ttf (700)

4. Run the app:
```bash
flutter run
```

## 📂 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_spacing.dart
│   └── theme/
│       └── app_theme.dart
├── widgets/
│   ├── buttons/
│   │   └── app_buttons.dart
│   ├── inputs/
│   │   └── app_inputs.dart
│   ├── cards/
│   │   └── app_cards.dart
│   └── navigation/
│       └── bottom_nav_bars.dart
├── screens/
│   ├── onboarding/
│   │   ├── onboarding_page.dart
│   │   └── login_page.dart
│   ├── registration/
│   │   ├── registration_step1_page.dart
│   │   └── registration_step2_page.dart
│   ├── patient/
│   │   └── patient_dashboard.dart
│   ├── doctor/
│   │   └── doctor_dashboard.dart
│   ├── nurse/
│   │   └── nurse_dashboard.dart
│   ├── pharmacy/
│   │   ├── pharmacy_page.dart
│   │   ├── cart_page.dart
│   │   ├── checkout_page.dart
│   │   └── order_success_page.dart
│   ├── lab/
│   │   └── lab_tests_page.dart
│   ├── health_records/
│   │   └── health_records_page.dart
│   ├── ambulance/
│   │   ├── request_ambulance_page.dart
│   │   └── ambulance_tracking_page.dart
│   ├── chat/
│   │   └── ai_assistant_page.dart
│   └── profile/
│       └── profile_page.dart
└── main.dart
```

## 🔧 Configuration

### Android
Minimum SDK: 21
Target SDK: 33

### iOS
Minimum iOS Version: 12.0

## 🎯 User Flows

### Patient Registration Flow
1. Onboarding (3 screens)
2. Registration Step 1 (Basic Info)
3. Registration Step 2 (Health Info)
4. Patient Dashboard

### Pharmacy Order Flow
1. Browse Pharmacy
2. Add items to Cart
3. Checkout & Select Address
4. Choose Payment Method
5. Order Success

### Ambulance Emergency Flow
1. Request Ambulance
2. Select Ambulance Type
3. Confirm Booking
4. Live Tracking with Safety Checklist

## 🌟 Key Features

- **Role-Based Access**: Different interfaces for patients, doctors, and nurses
- **Material Design 3**: Modern, beautiful UI with custom theme
- **Responsive Layout**: Optimized for various screen sizes
- **Dark Mode Support**: Complete dark theme implementation
- **Animations**: Smooth transitions and micro-interactions
- **State Management**: Efficient state handling
- **Security**: End-to-end encryption notices for sensitive operations

## 📝 Development Notes

- Built with Flutter 3.0+
- Uses Material Design 3 components
- Custom design system with consistent spacing and colors
- Modular architecture for easy maintenance
- Reusable widgets for consistent UI

## 🔐 Security Features

- Secure medical encryption
- HIPAA compliance ready
- End-to-end encrypted sessions
- Secure checkout guarantees

## 📄 License

This project is part of Drepto Biodevices Healthcare Platform.

## 👥 Contributing

This is a proprietary healthcare application. For contributions, please contact the development team.

## 📞 Support

For support and queries, contact: support@dreptobiodevices.com

---

**Built with ❤️ using Flutter**
