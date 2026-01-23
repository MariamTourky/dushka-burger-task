import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/addon_item_added_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_cart_item_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_group_entity.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';

extension AddonValidation on ProductDetailsState {
  bool isGroupValid(AddonGroupEntity group) {
    if (!group.required) return true;

    final selectedOptionId = selectedOptions[group.id];
    final min = group.minMaxRules?.min ?? 0;

    return selectedOptionId != null && 1 >= min;
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

  AddToCartEntity toAddToCartEntity() {
    final selectedItems = [
      AddCartItemEntity(
        productId: product.data!.id,
        quantity: quantity,
        addons:
            addons.data
                ?.expand((block) => block.groups)
                .expand(
                  (group) => group.options
                      .where((option) => selectedOptions[group.id] == option.id)
                      .map(
                        (option) => AddonItemAddedEntity(
                          id: option.id,
                          name: option.labelEn,
                          price: "0",
                        ),
                      ),
                )
                .toList() ??
            [],
      ),
    ];

    return AddToCartEntity(
      guestId: "", // repository will inject guestId
      items: selectedItems,
    );
  }
}
