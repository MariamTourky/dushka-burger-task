import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_options_entity.dart';

extension ProductAddonsMapper on ProductAddonsResponse {
  List<AddonBlockEntity> toEntity() {
    return blocks
        .map(
          (b) => AddonBlockEntity(
            id: b.id,
            titleEn: b.titleEn,
            titleAr: b.titleAr,
            isMultiChoice: b.isMultiChoice,
            options: b.options
                .map(
                  (o) => AddonOption(
                    id: o.id,
                    labelEn: o.label,
                    labelAr: o.labelAr,
                    selectedByDefault: o.selectedByDefault,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
