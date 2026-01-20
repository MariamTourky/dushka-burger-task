class ProductEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final String price;
  final String image;
  final String descriptionEn;
  final String descriptionAr;

  const ProductEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.image,
    required this.descriptionEn,
    required this.descriptionAr,
  });

  String dataByLocale(String locale) => locale == 'ar' ? nameAr : nameEn;
  String descriptionByLocale(String locale) =>
      locale == 'ar' ? descriptionAr : descriptionEn;
}
