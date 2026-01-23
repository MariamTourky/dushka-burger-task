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
  AddonItemCart toRequest() {
    return AddonItemCart(id: id, name: name, price: price);
  }
}

extension AddonItemCartMapper on AddonItemCart {
  AddonItemAddedEntity toEntity() {
    return AddonItemAddedEntity(
      id: id ?? 0,
      name: name ?? "",
      price: price ?? "0",
    );
  }
}
