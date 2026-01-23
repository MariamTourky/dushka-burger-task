import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/addons_sections/addon_group.dart';

class AddonsListWidget extends StatelessWidget {
  final ProductDetailsState state;
  const AddonsListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (!state.addons.isSuccess || state.addons.data == null) {
      return const SizedBox.shrink();
    }

    final locale = context.locale.languageCode;
    final blocks = state.addons.data!;
    if (blocks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.expand((block) {
        return block.groups.map(
          (group) => AddonGroup(group: group, locale: locale, state: state),
        );
      }).toList(),
    );
  }
}
