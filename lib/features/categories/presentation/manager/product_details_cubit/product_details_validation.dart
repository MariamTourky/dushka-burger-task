import 'package:trust_develpoment/features/categories/domain/entity_model/addons_group_entity.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';

extension AddonValidation on ProductDetailsState {
  bool isGroupValid(AddonGroupEntity group) {
    if (!group.required) return true;

    final selectedOptionId = selectedOptions[group.id];
    final min = group.minMaxRules?.min ?? 0;

    return selectedOptionId != null && min <= 1;
  }

  bool get areAllRequiredAddonsValid {
    final blocks = addons.data;
    if (blocks == null) return false;

    for (final block in blocks) {
      for (final group in block.groups) {
        if (!isGroupValid(group)) return false;
      }
    }
    return true;
  }
}
