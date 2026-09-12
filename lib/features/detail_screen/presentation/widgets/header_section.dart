import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.targetProduct});

  final Product targetProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(targetProduct.brand.toUpperCase(), style: AppTextStyle.caption),
        const SizedBox(height: AppSpacing.xs),
        Text(targetProduct.title, style: AppTextStyle.h2),
        const SizedBox(height: AppSpacing.md),
        Row(spacing: AppSpacing.md, children: [_rating(targetProduct.rating)]),
      ],
    );
  }

  static Widget _rating(double rating) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withAlpha(50),
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.warning),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        spacing: AppSpacing.xs,
        children: [
          const PhosphorIcon(
            PhosphorIcons.starFill,
            size: 16,
            color: AppColors.primary,
          ),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyle.subtitle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
