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

## 📂 Project Structure & File Reference

### 🏗️ Core Architecture (lib/core/)
- **[injection.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/injection.dart)**: Configuration for dependency injection using GetIt.
- **[network/api_service.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/network/api_service.dart)**: Centralized HTTP client and error handling.
- **[theme/app_theme.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/theme/app_theme.dart)**: Global application styling and Material 3 theme.
- **[utils/greeting_helper.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/utils/greeting_helper.dart)**: Helper for dynamic time-based user greetings.
- **[services/secure_storage_service.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/services/secure_storage_service.dart)**: Secure encryption for persistent storage of sensitive data.

#### 🎨 Design Constants
- **[constants/app_colors.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/constants/app_colors.dart)**: Central registry for all application colors.
- **[constants/app_spacing.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/constants/app_spacing.dart)**: Standardized layout dimensions and spacing tokens.
- **[constants/app_text_styles.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/constants/app_text_styles.dart)**: Definition of all typography styles.

#### 🔄 State Management (Providers)
- **[providers/auth_provider.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/providers/auth_provider.dart)**: Manages global authentication and user session state.
- **[providers/appointment_provider.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/providers/appointment_provider.dart)**: Handles state for all medical booking operations.
- **[providers/doctor_provider.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/providers/doctor_provider.dart)**: Manages listings and details of healthcare providers.
- **[providers/pharmacy_provider.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/providers/pharmacy_provider.dart)**: Logic for cart management and product browsing.

#### 📦 Data Layer (Repositories & Services)
- **[repositories/i_auth_repository.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/repositories/i_auth_repository.dart)**: Interface for authentication data operations.
- **[repositories/auth_repository.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/repositories/auth_repository.dart)**: API-linked implementation of authentication logic.
- **[services/auth_service.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/services/auth_service.dart)**: Higher-level business logic for secure user sessions.
- **[repositories/appointment_repository.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/repositories/appointment_repository.dart)**: Handles data fetching for medical appointments.
- **[services/appointment_service.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/core/services/appointment_service.dart)**: Manages the scheduling and lifecycle of consultations.

### 📊 Data Models (lib/models/)
- **[user_model.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/models/user_model.dart)**: Unified model for Patients, Doctors, and Administrators.
- **[appointment.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/models/appointment.dart)**: Encapsulates all data related to a medical consultation.
- **[doctor.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/models/doctor.dart)**: Detailed model for professional healthcare profiles.
- **[product.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/models/product.dart)**: Model representing medicines and health products.
- **`*.freezed.dart` / `*.g.dart`**: Auto-generated files for immutability and JSON serialization.

### 🖼️ UI Screens (lib/screens/)
#### 🔑 Authentication & Entry
- **[onboarding/splash_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/onboarding/splash_page.dart)**: Initial brand loading screen.
- **[onboarding/onboarding_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/onboarding/onboarding_page.dart)**: Welcome and feature walkthrough screens.
- **[onboarding/login_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/onboarding/login_page.dart)**: Secure user login interface.
- **[onboarding/registration_step1_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/onboarding/registration_step1_page.dart)**: Initial registration step for profile setup.

#### 🏥 Medical & Appointments
- **[patient/patient_dashboard.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/patient/patient_dashboard.dart)**: Hub for patient health services.
- **[patient/doctor_selection_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/patient/doctor_selection_page.dart)**: Directory for finding and selecting doctors.
- **[doctor/doctor_details_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/doctor/doctor_details_page.dart)**: Comprehensive profile view for individual doctors.
- **[patient/patient_schedule_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/patient/patient_schedule_page.dart)**: List of upcoming and historical appointments.

#### 💊 Pharmacy & Logistics
- **[pharmacy/pharmacy_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/pharmacy/pharmacy_page.dart)**: Digital storefront for medical supplies.
- **[pharmacy/cart_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/pharmacy/cart_page.dart)**: Shopping basket management.
- **[ambulance/request_ambulance_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/ambulance/request_ambulance_page.dart)**: Rapid interface for emergency transport requests.

#### 👤 Profile & Help
- **[profile/profile_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/profile/profile_page.dart)**: User account and health statistics overview.
- **[chat/ai_assistant_page.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/screens/chat/ai_assistant_page.dart)**: Interface for help from the AI health assistant.

### 🧩 Shared Widgets (lib/widgets/)
- **[cards/appointment_card.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/widgets/cards/appointment_card.dart)**: Reusable card for displaying appointment details.
- **[inputs/app_inputs.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/widgets/inputs/app_inputs.dart)**: Suite of custom text and search fields.
- **[navigation/bottom_nav_bars.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/widgets/navigation/bottom_nav_bars.dart)**: Context-aware navigation bars for different user roles.

### 🏁 App Entry
- **[main.dart](file:///c:/Users/naikw/OneDrive/Desktop/Drepto%20Mobile%20App/Drepto_mobile/drepto_healthcare/lib/main.dart)**: Root of the application, initializes providers and routes.

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
