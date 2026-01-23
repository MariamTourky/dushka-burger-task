import 'package:equatable/equatable.dart';
import 'package:trust_develpoment/app/config/base_state/base_state.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';

class CartState extends Equatable {
  final BaseState<CartEntity> cart;

  const CartState({required this.cart});

  factory CartState.initial() {
    return CartState(cart: BaseState.initial());
  }

  int get itemCount =>
      cart.data?.items.fold<int>(0, (sum, item) => sum + item.quantity) ?? 0;

  String get totalPrice => cart.data?.totalPrice ?? "0";
  String get totalPriceWithTax => cart.data?.totalPriceWithTax ?? "0";

  int get totalItems => cart.data?.totalItems ?? 0;

  CartState copyWith({BaseState<CartEntity>? cart}) {
    return CartState(cart: cart ?? this.cart);
  }

  @override
  List<Object?> get props => [cart];
}
