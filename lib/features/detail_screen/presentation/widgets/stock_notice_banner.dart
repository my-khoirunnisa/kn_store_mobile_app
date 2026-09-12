import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class StockNoticeBanner extends StatelessWidget {
  const StockNoticeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withAlpha(50),
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.warning),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.warning,
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: PhosphorIcon(
              PhosphorIcons.warning,
              color: AppColors.secondary,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.xs,
              children: [
                Text("Low Stock Notification", style: AppTextStyle.subtitle),
                Text(
                  "Only 2 items left! Grab yours before it's gone.",
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
