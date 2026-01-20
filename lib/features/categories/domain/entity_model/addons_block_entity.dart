import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';

class AddonBlock {
  final int id;
  final String titleEn;
  final String titleAr;
  final bool isMultiChoice;
  final List<AddonOption> options;

  AddonBlock({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.isMultiChoice,
    required this.options,
  });
}
