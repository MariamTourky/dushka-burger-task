// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../network/interceptor.dart' as _i1070;
import '../../storage/guest_cart_storage.dart' as _i1019;
import '../network_module.dart' as _i588;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i1019.GuestCartStorage>(
      () => networkModule.guestCartStorage(),
    );
    gh.lazySingleton<_i1070.AppInterceptor>(
      () => networkModule.interceptor(gh<_i1019.GuestCartStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i1070.AppInterceptor>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i588.NetworkModule {}
