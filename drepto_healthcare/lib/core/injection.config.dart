// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'providers/appointment_provider.dart' as _i471;
import 'providers/auth_provider.dart' as _i219;
import 'providers/doctor_provider.dart' as _i524;
import 'providers/lab_provider.dart' as _i287;
import 'providers/nurse_provider.dart' as _i621;
import 'providers/payment_provider.dart' as _i784;
import 'providers/pharmacy_provider.dart' as _i253;
import 'repositories/admin_repository.dart' as _i3;
import 'repositories/appointment_repository.dart' as _i885;
import 'repositories/auth_repository.dart' as _i665;
import 'repositories/doctor_repository.dart' as _i284;
import 'repositories/i_appointment_repository.dart' as _i1053;
import 'repositories/i_auth_repository.dart' as _i979;
import 'repositories/i_doctor_repository.dart' as _i38;
import 'repositories/i_lab_repository.dart' as _i864;
import 'repositories/i_logistics_repository.dart' as _i1054;
import 'repositories/i_nurse_repository.dart' as _i146;
import 'repositories/i_payment_repository.dart' as _i667;
import 'repositories/i_pharmacy_repository.dart' as _i878;
import 'repositories/lab_repository.dart' as _i195;
import 'repositories/logistics_repository.dart' as _i70;
import 'repositories/nurse_repository.dart' as _i981;
import 'repositories/payment_repository.dart' as _i320;
import 'repositories/pharmacy_repository.dart' as _i489;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AdminRepository>(() => _i3.AdminRepository());
    gh.lazySingleton<_i864.ILabRepository>(() => _i195.LabRepository());
    gh.lazySingleton<_i287.LabProvider>(
        () => _i287.LabProvider(gh<_i864.ILabRepository>()));
    gh.lazySingleton<_i1053.IAppointmentRepository>(
        () => _i885.AppointmentRepository());
    gh.lazySingleton<_i979.IAuthRepository>(() => _i665.AuthRepository());
    gh.lazySingleton<_i667.IPaymentRepository>(() => _i320.PaymentRepository());
    gh.lazySingleton<_i1054.ILogisticsRepository>(
        () => _i70.LogisticsRepository());
    gh.lazySingleton<_i878.IPharmacyRepository>(
        () => _i489.PharmacyRepository());
    gh.lazySingleton<_i146.INurseRepository>(() => _i981.NurseRepository());
    gh.lazySingleton<_i621.NurseProvider>(
        () => _i621.NurseProvider(gh<_i146.INurseRepository>()));
    gh.lazySingleton<_i219.AuthProvider>(
        () => _i219.AuthProvider(gh<_i979.IAuthRepository>()));
    gh.lazySingleton<_i38.IDoctorRepository>(() => _i284.DoctorRepository());
    gh.lazySingleton<_i524.DoctorProvider>(
        () => _i524.DoctorProvider(gh<_i38.IDoctorRepository>()));
    gh.lazySingleton<_i784.PaymentProvider>(
        () => _i784.PaymentProvider(gh<_i667.IPaymentRepository>()));
    gh.lazySingleton<_i471.AppointmentProvider>(
        () => _i471.AppointmentProvider(gh<_i1053.IAppointmentRepository>()));
    gh.lazySingleton<_i253.PharmacyProvider>(
        () => _i253.PharmacyProvider(gh<_i878.IPharmacyRepository>()));
    return this;
  }
}
