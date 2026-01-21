import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/data/datasource_contract/categories_remote_datasource.dart';
import 'package:trust_develpoment/features/categories/data/mappers/categories_mapper.dart';
import 'package:trust_develpoment/features/categories/data/mappers/product_addons_mapper.dart';
import 'package:trust_develpoment/features/categories/data/mappers/product_mapper.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/features/categories/domain/repo_contract/categories_repo.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource remoteDatasource;

  CategoriesRepositoryImpl(this.remoteDatasource);

  @override
  Future<ApiResult<List<CategoryEntity>>> getCategories() async {
    final result = await remoteDatasource.getCategories();

    if (result is SuccessApiResult<List<CategoriesResponse>>) {
      return SuccessApiResult(
        data: result.data.map((e) => e.toEntity()).toList(),
      );
    }

    if (result is ErrorApiResult<List<CategoriesResponse>>) {
      return ErrorApiResult(error: result.error);
    }

    return ErrorApiResult(error: 'Unexpected error');
  }

  @override
  Future<ApiResult<ProductEntity>> getProductDetails(int productId) async {
    final result = await remoteDatasource.getProductDetails(productId);

    if (result is SuccessApiResult<List<ProductResponse>>) {
      if (result.data.isEmpty) {
        return ErrorApiResult(error: 'Product not found');
      }

      return SuccessApiResult(data: result.data.first.toEntity());
    }

    if (result is ErrorApiResult<List<ProductResponse>>) {
      return ErrorApiResult(error: result.error);
    }

    return ErrorApiResult(error: 'Unexpected error');
  }

  @override
  Future<ApiResult<List<AddonBlockEntity>>> getProductAddons(
    int productId,
  ) async {
    final result = await remoteDatasource.getProductAddons(productId);

    if (result is SuccessApiResult<ProductAddonsResponse>) {
      final blocks = result.data.toEntity();
      return SuccessApiResult(data: blocks);
    }

    if (result is ErrorApiResult<ProductAddonsResponse>) {
      return ErrorApiResult(error: result.error);
    }

    return ErrorApiResult(error: 'Unexpected error');
  }
}
