import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:drepto_healthcare/core/injection.dart';
import 'package:drepto_healthcare/core/providers/auth_provider.dart';
import 'package:drepto_healthcare/core/providers/nurse_provider.dart';
import 'package:drepto_healthcare/core/providers/doctor_provider.dart';
import 'package:drepto_healthcare/core/providers/appointment_provider.dart';
import 'package:drepto_healthcare/core/providers/pharmacy_provider.dart';
import 'package:drepto_healthcare/core/providers/lab_provider.dart';
import 'package:drepto_healthcare/core/providers/payment_provider.dart';
import 'package:drepto_healthcare/core/theme/app_theme.dart';
import 'package:drepto_healthcare/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies (GetIt + Injectable)
  configureDependencies();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Check initial status
  final authProvider = getIt<AuthProvider>();
  authProvider.checkAuthStatus(); // Securely restore session if exists

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => getIt<NurseProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<DoctorProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<AppointmentProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<PharmacyProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<LabProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<PaymentProvider>()),
      ],
      child: const DreptoHealthcareApp(),
    ),
  );
}

class DreptoHealthcareApp extends StatelessWidget {
  const DreptoHealthcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard mobile design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Get auth provider to create router with auth guards
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final router = AppRouter.createRouter(authProvider);

        return MaterialApp.router(
          title: 'Drepto Healthcare',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
