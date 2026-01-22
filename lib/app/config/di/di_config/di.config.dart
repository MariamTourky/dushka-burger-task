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

import '../../../../features/cart/api/cart_remote_datasource_impl.dart'
    as _i394;
import '../../../../features/cart/data/datasource/cart_remote_datasource_contract.dart'
    as _i486;
import '../../../../features/cart/data/repo_impl/cart_repository_impl.dart'
    as _i907;
import '../../../../features/cart/domain/repo_contract/cart_repo_contract.dart'
    as _i664;
import '../../../../features/cart/domain/usecase/add_to_cart_usecase.dart'
    as _i60;
import '../../../../features/cart/domain/usecase/delete_from_cart_usecase.dart'
    as _i712;
import '../../../../features/cart/domain/usecase/get_cart_usecase.dart'
    as _i955;
import '../../../../features/cart/domain/usecase/get_guest_id_usecase.dart'
    as _i728;
import '../../../../features/cart/presentation/manager/cart_cubit.dart'
    as _i354;
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
import '../../../../features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart'
    as _i219;
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
    gh.lazySingleton<_i486.CartRemoteDatasourceContract>(
      () => _i394.CartRemoteDatasourceImpl(
        gh<_i0.ApiClient>(),
        gh<_i1019.GuestCartStorage>(),
      ),
    );
    gh.lazySingleton<_i664.CartRepository>(
      () => _i907.CartRepositoryImpl(
        gh<_i486.CartRemoteDatasourceContract>(),
        gh<_i1019.GuestCartStorage>(),
      ),
    );
    gh.lazySingleton<_i289.CategoriesRemoteDatasource>(
      () => _i299.CategoriesRemoteDatasourceImpl(gh<_i0.ApiClient>()),
    );
    gh.lazySingleton<_i60.AddToCartUseCase>(
      () => _i60.AddToCartUseCase(gh<_i664.CartRepository>()),
    );
    gh.lazySingleton<_i712.DeleteFromCartUseCase>(
      () => _i712.DeleteFromCartUseCase(gh<_i664.CartRepository>()),
    );
    gh.lazySingleton<_i955.GetCartUseCase>(
      () => _i955.GetCartUseCase(gh<_i664.CartRepository>()),
    );
    gh.lazySingleton<_i728.GetGuestIdUseCase>(
      () => _i728.GetGuestIdUseCase(gh<_i664.CartRepository>()),
    );
    gh.lazySingleton<_i354.CartCubit>(
      () => _i354.CartCubit(
        gh<_i728.GetGuestIdUseCase>(),
        gh<_i955.GetCartUseCase>(),
        gh<_i60.AddToCartUseCase>(),
        gh<_i712.DeleteFromCartUseCase>(),
      ),
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
    gh.factory<_i219.ProductDetailsCubit>(
      () => _i219.ProductDetailsCubit(
        gh<_i399.GetProductDetailsUseCase>(),
        gh<_i873.GetProductAddonsUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i588.NetworkModule {}
