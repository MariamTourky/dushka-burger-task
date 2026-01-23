import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';

class CardItemWidget extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  final String title;
  final String? subtitle;
  final List<String>? tags;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CardItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.tags,
    this.onTap,
    this.trailing,
    this.imageSize = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: imageUrl.isNotEmpty
                      ? Image.network(imageUrl, fit: BoxFit.cover)
                      : Container(color: AppColors.divider),
                ),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        subtitle!,
                        style: AppTextStyles.price.copyWith(
                          color: AppColors.darkRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (tags != null && tags!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        tags!.join(", "),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.gray,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              if (trailing != null) ...[const SizedBox(width: 4), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
