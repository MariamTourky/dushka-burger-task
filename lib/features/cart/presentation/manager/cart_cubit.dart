import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/get_cart_item_entity.dart';
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
    await fetchCartFromServer();
  }

  Future<void> fetchCartFromServer() async {
    emit(state.copyWith(cart: BaseState.loading()));
    final result = await getCart();
    if (result is SuccessApiResult<CartEntity>) {
      emit(state.copyWith(cart: BaseState.success(result.data)));
    } else {
      emit(state.copyWith(cart: BaseState.error("Failed to load cart")));
    }
  }

  CartEntity _recalculateTotals(CartEntity cart) {
    final totalItems = cart.items.fold<int>(0, (sum, i) => sum + i.quantity);
    final totalPrice = cart.items.fold<double>(
      0.0,
      (sum, i) => sum + (double.tryParse(i.total) ?? 0.0),
    );

    final totalPriceWithTax = totalPrice * 1.14;

    return cart.copyWith(
      totalItems: totalItems,
      totalPrice: totalPrice.toStringAsFixed(2),
      totalPriceWithTax: totalPriceWithTax.toStringAsFixed(2),
    );
  }

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

    emit(
      state.copyWith(
        cart: BaseState.success(
          _recalculateTotals(currentCart.copyWith(items: updatedItems)),
        ),
      ),
    );

    final result = await deleteFromCart(
      productId: productId,
      quantity: quantity,
    );

    if (result is! SuccessApiResult) {
      await fetchCartFromServer();
    }
  }

  Future<void> addItem(AddToCartEntity entity) async {
    final currentCart = state.cart.data;

    if (currentCart != null) {
      final items = [...currentCart.items];

      for (final newItem in entity.items) {
        final index = items.indexWhere((e) => e.productId == newItem.productId);

        if (index != -1) {
          // Item exists, increment quantity
          items[index] = items[index].copyWith(
            quantity: items[index].quantity + newItem.quantity,
          );
        } else {
          // New item, add to list
          items.add(
            GetCartItemEntity(
              productId: newItem.productId,
              productName: '',
              productNameAr: '',
              quantity: newItem.quantity,
              price: '0',
              addons: newItem.addons,
              image: '',
              total: '0',
            ),
          );
        }
      }

      emit(
        state.copyWith(
          cart: BaseState.success(
            _recalculateTotals(currentCart.copyWith(items: items)),
          ),
        ),
      );
    }

    await fetchCartFromServer();
  }
}
