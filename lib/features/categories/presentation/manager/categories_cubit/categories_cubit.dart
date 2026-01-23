import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_state.dart';
import 'package:trust_develpoment/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase useCase;

  CategoriesCubit(this.useCase) : super(CategoriesState.initial());

  Future<void> fetchCategories() async {
    emit(state.copyWith(categories: BaseState.loading()));

    final result = await useCase.call();

    if (result is SuccessApiResult<List<CategoryEntity>>) {
      final firstCategoryId = result.data.isNotEmpty
          ? result.data.first.id
          : null;

      emit(
        state.copyWith(
          categories: BaseState.success(result.data),
          selectedCategoryId: firstCategoryId,
        ),
      );
    } else if (result is ErrorApiResult<List<CategoryEntity>>) {
      emit(state.copyWith(categories: BaseState.error(result.error)));
    } else {
      emit(state.copyWith(categories: BaseState.error("Unknown error")));
    }
  }

  void selectCategory(int id) {
    emit(state.copyWith(selectedCategoryId: id));
  }
}
