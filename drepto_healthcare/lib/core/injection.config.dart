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

import 'providers/auth_provider.dart' as _i219;
import 'repositories/auth_repository.dart' as _i665;
import 'repositories/i_auth_repository.dart' as _i979;

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
    gh.lazySingleton<_i979.IAuthRepository>(() => _i665.AuthRepository());
    gh.lazySingleton<_i219.AuthProvider>(
        () => _i219.AuthProvider(gh<_i979.IAuthRepository>()));
    return this;
  }
}
