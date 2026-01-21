class CartItemEntity {
  final int productId;
  final String nameEn;
  final String nameAr;
  final int quantity;
  final String image;
  final String total;

  CartItemEntity({
    required this.productId,
    required this.nameEn,
    required this.nameAr,
    required this.quantity,
    required this.image,
    required this.total,
  });

  String nameByLocale(String locale) => locale == 'ar' ? nameAr : nameEn;
}
