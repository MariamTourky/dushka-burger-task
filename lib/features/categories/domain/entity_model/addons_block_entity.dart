import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';

class AddonBlockEntity {
  final int id;
  final String titleEn;
  final String titleAr;
  final List<AddonGroupEntity> groups;

  AddonBlockEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.groups,
  });

  String dataByLocale(String locale) => locale == 'ar' ? titleAr : titleEn;
}

class AddonGroupEntity {
  final int id;
  final String titleEn;
  final String titleAr;
  final bool isMultiChoice;
  final List<AddonOptionEntity> options;

  AddonGroupEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.isMultiChoice,
    required this.options,
  });
}
