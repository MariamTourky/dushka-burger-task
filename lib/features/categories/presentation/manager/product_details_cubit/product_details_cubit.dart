import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/features/categories/domain/usecase/get_product_details_usecase.dart';
import 'package:trust_develpoment/features/categories/domain/usecase/get_products_addons_usecase.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetails;
  final GetProductAddonsUseCase getProductAddons;

  ProductDetailsCubit(this.getProductDetails, this.getProductAddons)
    : super(ProductDetailsState.initial());

  Future<void> loadProduct(int productId, {int initialQuantity = 0}) async {
    emit(state.copyWith(quantity: initialQuantity));

    await Future.wait([
      fetchProductDetails(productId),
      fetchProductAddons(productId),
    ]);
  }

  Future<void> fetchProductDetails(int productId) async {
    emit(state.copyWith(product: BaseState.loading()));

    final result = await getProductDetails(productId);

    if (result is SuccessApiResult<ProductEntity>) {
      emit(state.copyWith(product: BaseState.success(result.data)));
    } else if (result is ErrorApiResult<ProductEntity>) {
      emit(state.copyWith(product: BaseState.error(result.error)));
    } else {
      emit(state.copyWith(product: BaseState.error("Unknown error")));
    }
  }

  Future<void> fetchProductAddons(int productId) async {
    emit(state.copyWith(addons: BaseState.loading()));

    final result = await getProductAddons(productId);

    if (result is SuccessApiResult<List<AddonBlockEntity>>) {
      emit(state.copyWith(addons: BaseState.success(result.data)));
    } else if (result is ErrorApiResult<List<AddonBlockEntity>>) {
      emit(state.copyWith(addons: BaseState.error(result.error)));
    } else {
      emit(state.copyWith(addons: BaseState.error("Unknown error")));
    }
  }

  void selectOption(int groupId, int optionId) {
    emit(
      state.copyWith(
        selectedOptions: {...state.selectedOptions, groupId: optionId},
      ),
    );
  }

  void incrementQuantity() =>
      emit(state.copyWith(quantity: state.quantity + 1));

  void decrementQuantity() {
    if (state.quantity > 0) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }
}
