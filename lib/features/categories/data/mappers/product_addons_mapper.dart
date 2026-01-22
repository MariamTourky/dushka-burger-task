import 'package:trust_develpoment/features/categories/domain/entity_model/addons_group_entity.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/min_max_entity.dart';

extension ProductAddonsMapper on ProductAddonsResponse {
  List<AddonBlockEntity> toEntity() {
    return blocks.map((block) {
      return AddonBlockEntity(
        id: block.id,
        titleEn: block.name,
        groups: block.addons.map((addon) {
          return AddonGroupEntity(
            id: addon.id,
            titleEn: addon.titleEn,
            titleAr: addon.titleAr,
            isMultiChoice: addon.isMultiChoice,
            required: addon.required ?? false,
            minMaxRules: addon.minMaxRules == null
                ? null
                : MinMaxRulesEntity(
                    min: addon.minMaxRules!.min,
                    max: addon.minMaxRules!.max,
                    exact: addon.minMaxRules!.exact,
                  ),
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
