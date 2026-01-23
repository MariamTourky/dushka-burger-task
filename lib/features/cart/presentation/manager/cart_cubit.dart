import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
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
    emit(state.copyWith(cart: Resource.loading()));

    final result = await getCart();
    if (result is SuccessApiResult<CartEntity>) {
      emit(state.copyWith(cart: Resource.success(result.data)));
    }
  }

  /// 🔥 OPTIMISTIC DELETE
  Future<void> removeItem({required int productId, int quantity = 1}) async {
    final currentCart = state.cart.data;
    if (currentCart == null) return;

    final updatedItems = currentCart.items
        .map((item) {
          if (item.productId == productId) {
            final newQty = item.quantity - quantity;
            return item.copyWith(quantity: newQty);
          }
          return item;
        })
        .where((item) => item.quantity > 0)
        .toList();

    final updatedCart = currentCart.copyWith(items: updatedItems);

    /// ✅ update UI immediately
    emit(state.copyWith(cart: Resource.success(updatedCart)));

    /// call API
    final result = await deleteFromCart(
      productId: productId,
      quantity: quantity,
    );

    /// optional: resync
    if (result is! SuccessApiResult) {
      await refreshCart();
    }
  }

  /// 🔥 OPTIMISTIC ADD
  Future<void> addItem(AddToCartEntity entity) async {
    final currentCart = state.cart.data;

    if (currentCart != null) {
      final items = [...currentCart.items];

      for (final newItem in entity.items) {
        final index = items.indexWhere((e) => e.productId == newItem.productId);

        if (index != -1) {
          items[index] = items[index].copyWith(
            quantity: items[index].quantity + newItem.quantity,
          );
        }
      }

      emit(
        state.copyWith(
          cart: Resource.success(currentCart.copyWith(items: items)),
        ),
      );
    }

    final result = await addToCart(entity);
    if (result is! SuccessApiResult) {
      await refreshCart();
    }
  }
}
