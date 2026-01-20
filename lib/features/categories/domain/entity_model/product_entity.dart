class ProductEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final String price;
  final String image;

  const ProductEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.image,
  });

  String dataByLocale(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }
}
