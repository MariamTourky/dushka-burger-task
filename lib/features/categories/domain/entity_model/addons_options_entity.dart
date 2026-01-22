class AddonOptionEntity {
  final int id;
  final String labelEn;
  final String labelAr;
  final bool selectedByDefault;

  AddonOptionEntity({
    required this.id,
    required this.labelEn,
    required this.labelAr,
    required this.selectedByDefault,
  });

  String labelByLocale(String locale) => locale == 'ar' ? labelAr : labelEn;
}
