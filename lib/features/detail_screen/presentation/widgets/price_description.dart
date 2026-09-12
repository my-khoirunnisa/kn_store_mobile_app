import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:kn_store_mobile_app/core/utils/price_utils.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class PriceDescription extends StatelessWidget {
  const PriceDescription({super.key, required this.targetProduct});

  final Product targetProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.outline),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // price
                  Text(
                    PriceUtils.formatPrice(targetProduct.price),
                    style: AppTextStyle.h2.copyWith(color: AppColors.primary),
                  ),
                  if (targetProduct.discountPercentage > 0) ...[
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      PriceUtils.formatOriginalPrice(
                        targetProduct.price,
                        targetProduct.discountPercentage,
                      ),
                      style: AppTextStyle.subtitle.copyWith(
                        color: AppColors.lightGrey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ],
              ),
              if (targetProduct.discountPercentage > 0)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(AppSpacing.lg),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  child: Text(
                    PriceUtils.formatDiscount(targetProduct.discountPercentage),
                    style: AppTextStyle.subtitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
          const Divider(height: AppSpacing.xl, color: AppColors.outline),
          const SizedBox(height: AppSpacing.xs),
          Text(
            targetProduct.description.isNotEmpty ? targetProduct.description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: AppTextStyle.bodySmall,
          ),
        ],
      ),
    );
  }
}
