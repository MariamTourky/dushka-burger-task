import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_item_added_entity.dart';
import 'package:trust_develpoment/features/cart/domain/usecase/add_to_cart_usecase.dart';
import 'package:trust_develpoment/features/cart/domain/usecase/delete_from_cart_usecase.dart';
import 'package:trust_develpoment/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:trust_develpoment/features/cart/domain/usecase/get_guest_id_usecase.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_state.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  final GetGuestIdUseCase getGuestId;
  final GetCartUseCase getCart;
  final AddToCartUseCase addToCart;
  final DeleteFromCartUseCase deleteFromCart;

  CartCubit(this.getGuestId, this.getCart, this.addToCart, this.deleteFromCart)
    : super(CartState.initial()) {
    initCart();
  }

  Future<void> initCart() async {
    await getGuestId();
    await refreshCart();
  }

  Future<void> refreshCart() async {
    final result = await getCart();
    if (result is SuccessApiResult<CartEntity>) {
      final updatedCart = result.data.copyWith();
      emit(state.copyWith(cart: Resource.success(updatedCart)));
    }
  }

  Future<void> addItem({
    required int productId,
    required int quantity,
    required List<AddonItemAddedEntity> addons,
  }) async {
    final entity = AddToCartEntity(
      guestId: '',
      items: [
        CartItemAddedEntity(
          productId: productId,
          quantity: quantity,
          addons: addons,
        ),
      ],
    );

    final result = await addToCart(entity);

    if (result is SuccessApiResult) {
      await refreshCart();
    }
  }

  Future<void> removeItem(int productId, {int quantity = 1}) async {
    final result = await deleteFromCart(
      productId: productId,
      quantity: quantity,
    );

    if (result is SuccessApiResult) {
      await refreshCart();
    }
  }
}
