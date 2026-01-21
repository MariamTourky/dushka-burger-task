import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/app/core/utils/add_to_cart_icon.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';

class AddMinusRow extends StatelessWidget {
  const AddMinusRow({super.key, required this.state});

  final ProductDetailsState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          onTap: () => context.read<ProductDetailsCubit>().decrementQuantity(),
          icon: Icons.remove,
          isEnabled: state.quantity > 0,
        ),
        const SizedBox(width: 8),
        Text('${state.quantity}', style: AppTextStyles.headlineMedium),
        const SizedBox(width: 8),
        CustomIcon(
          onTap: () => context.read<ProductDetailsCubit>().incrementQuantity(),
          icon: Icons.add,
          isEnabled: true,
        ),
      ],
    );
  }
}
