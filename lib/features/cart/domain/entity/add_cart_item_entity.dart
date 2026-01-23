import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

class AddCartItemEntity {
  final int productId;
  final int quantity;
  final List<AddonItemAddedEntity> addons;

  const AddCartItemEntity({
    required this.productId,
    required this.quantity,
    this.addons = const [],
  });
}
