import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';

class GetCartItemEntity {
  final int productId;
  final String productName;
  final String productNameAr;
  final int quantity;
  final String price;
  final List<AddonItemAddedEntity> addons;
  final String image;
  final String total;

  const GetCartItemEntity({
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

  GetCartItemEntity copyWith({int? quantity, String? total}) {
    return GetCartItemEntity(
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
