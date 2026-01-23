import 'package:trust_develpoment/features/cart/data/models/response_model/cart_item_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

class CartItemEntity {
  final int productId;
  final String productName;
  final String productNameAr;
  final int quantity;
  final String price;
  final List<AddonItemAddedEntity> addons;
  final String image;
  final String total;

  const CartItemEntity({
    required this.productId,
    required this.productName,
    required this.productNameAr,
    required this.quantity,
    required this.price,
    required this.addons,
    required this.image,
    required this.total,
  });

  String nameByLocale(String locale) =>
      locale == 'ar' ? productNameAr : productName;

  CartItemEntity copyWith({int? quantity, String? total}) {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      productNameAr: productNameAr,
      quantity: quantity ?? this.quantity,
      price: price,
      addons: addons,
      image: image,
      total: total ?? this.total,
    );
  }
}

extension CartItemResponseMapper on CartItemResponse {
  CartItemEntity toEntity() {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      productNameAr: productNameAr,
      quantity: quantity,
      price: price,
      addons: addons?.map((e) => e.toEntity()).toList() ?? [],
      image: image,
      total: total,
    );
  }
}
