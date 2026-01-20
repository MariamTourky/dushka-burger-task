import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/data/datasource_contract/categories_remote_datasource.dart';
import 'package:trust_develpoment/features/categories/data/mappers/categories_mapper.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
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
}
