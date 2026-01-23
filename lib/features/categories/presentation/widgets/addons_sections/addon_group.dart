import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_group_entity.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/addons_sections/addons_option.dart';

class AddonGroup extends StatelessWidget {
  final AddonGroupEntity group;
  final String locale;
  final ProductDetailsState state;

  const AddonGroup({
    super.key,
    required this.group,
    required this.locale,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.titleByLocale(locale),
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.darkRed,
            ),
          ),
          const SizedBox(height: 12),

          ...group.options.map(
            (option) => AddonOptionWidget(
              option: option,
              isSelected: state.selectedOptions[group.id] == option.id,
              onTap: () {
                context.read<ProductDetailsCubit>().selectOption(
                  group.id,
                  option.id,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
