import 'package:trust_develpoment/features/cart/domain/entity/add_cart_item_entity.dart';

class AddToCartEntity {
  final String guestId;
  final List<AddCartItemEntity> items;

  const AddToCartEntity({required this.guestId, required this.items});
}
