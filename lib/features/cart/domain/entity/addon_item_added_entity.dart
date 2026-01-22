import 'package:trust_develpoment/features/cart/data/models/request_models/addon_item_request.dart';

class AddonItemAddedEntity {
  final int id;
  final String name;
  final String price;

  const AddonItemAddedEntity({
    required this.id,
    required this.name,
    required this.price,
  });
}

extension AddonItemEntityMapper on AddonItemAddedEntity {
  AddonItemRequest toRequest() {
    return AddonItemRequest(id: id, name: name, price: price);
  }
}
