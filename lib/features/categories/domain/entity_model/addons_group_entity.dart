import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/min_max_entity.dart';

class AddonGroupEntity {
  final int id;
  final String titleEn;
  final String titleAr;
  final bool isMultiChoice;
  final bool required;
  final MinMaxRulesEntity? minMaxRules;
  final List<AddonOptionEntity> options;

  AddonGroupEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.isMultiChoice,
    required this.required,
    this.minMaxRules,
    required this.options,
  });

  String titleByLocale(String locale) => locale == 'ar' ? titleAr : titleEn;
}
