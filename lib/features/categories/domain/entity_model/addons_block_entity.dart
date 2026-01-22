import 'package:trust_develpoment/features/categories/domain/entity_model/addons_group_entity.dart';

class AddonBlockEntity {
  final int id;
  final String titleEn;
  final List<AddonGroupEntity> groups;

  AddonBlockEntity({
    required this.id,
    required this.titleEn,
    required this.groups,
  });
}
