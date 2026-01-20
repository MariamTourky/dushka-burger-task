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

import '../../../../features/categories/api/datasource_impl/categories_remote_datasource_impl.dart'
    as _i299;
import '../../../../features/categories/data/datasource_contract/categories_remote_datasource.dart'
    as _i289;
import '../../../../features/categories/data/repo_impl/categories_repo_impl.dart'
    as _i52;
import '../../../../features/categories/domain/repo_contract/categories_repo.dart'
    as _i300;
import '../../../../features/categories/domain/usecase/get_categories_usecase.dart'
    as _i1035;
import '../../../../features/categories/domain/usecase/get_product_details_usecase.dart'
    as _i399;
import '../../../../features/categories/domain/usecase/get_products_addons_usecase.dart'
    as _i873;
import '../../../../features/categories/presentation/manager/categories_cubit/categories_cubit.dart'
    as _i786;
import '../../network/api_manager/api_client.dart' as _i0;
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
    gh.lazySingleton<_i0.ApiClient>(
      () => networkModule.apiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i289.CategoriesRemoteDatasource>(
      () => _i299.CategoriesRemoteDatasourceImpl(gh<_i0.ApiClient>()),
    );
    gh.lazySingleton<_i300.CategoriesRepository>(
      () =>
          _i52.CategoriesRepositoryImpl(gh<_i289.CategoriesRemoteDatasource>()),
    );
    gh.lazySingleton<_i1035.GetCategoriesUseCase>(
      () => _i1035.GetCategoriesUseCase(gh<_i300.CategoriesRepository>()),
    );
    gh.lazySingleton<_i873.GetProductAddonsUseCase>(
      () => _i873.GetProductAddonsUseCase(gh<_i300.CategoriesRepository>()),
    );
    gh.lazySingleton<_i399.GetProductDetailsUseCase>(
      () => _i399.GetProductDetailsUseCase(gh<_i300.CategoriesRepository>()),
    );
    gh.factory<_i786.CategoriesCubit>(
      () => _i786.CategoriesCubit(gh<_i1035.GetCategoriesUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i588.NetworkModule {}
