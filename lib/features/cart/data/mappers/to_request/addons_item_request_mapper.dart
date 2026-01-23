import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

extension AddonItemRequestMapper on AddonItemAddedEntity {
  AddonItemCart toRequest() {
    return AddonItemCart(id: id, name: name, price: price);
  }
}
