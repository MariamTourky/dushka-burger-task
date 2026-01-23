import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

extension AddonItemCartResponseMapper on AddonItemCart {
  AddonItemAddedEntity toEntity() {
    return AddonItemAddedEntity(
      id: id ?? 0,
      name: name ?? "",
      price: price ?? "0",
    );
  }
}
