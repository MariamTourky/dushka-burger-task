import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';

extension ProductAddonsMapper on ProductAddonsResponse {
  List<AddonBlockEntity> toEntity() {
    return blocks.map((block) {
      return AddonBlockEntity(
        id: block.id,
        titleEn: block.titleEn,
        titleAr: block.titleAr,
        groups: block.addons.map((addon) {
          return AddonGroupEntity(
            id: addon.id,
            titleEn: addon.titleEn,
            titleAr: addon.titleAr,
            isMultiChoice: addon.isMultiChoice,
            options: addon.options.asMap().entries.map((e) {
              final index = e.key;
              final o = e.value;
              return AddonOptionEntity(
                id: index,
                labelEn: o.label,
                labelAr: o.labelAr,
                selectedByDefault: o.selectedByDefault,
              );
            }).toList(),
          );
        }).toList(),
      );
    }).toList();
  }
}
