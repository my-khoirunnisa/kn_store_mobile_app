import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class WarrantyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconColor;

  const WarrantyCard({
    super.key,
    this.title = "",
    this.subtitle = "",
    this.icon = PhosphorIcons.sealCheck,
    this.iconColor = AppColors.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.outline),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.outline),
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: PhosphorIcon(
              icon,
              color: iconColor ?? AppColors.primary,
              size: 24,
            ),
          ),
          Expanded(
            child: Column(
              spacing: AppSpacing.xs,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.subtitle),
                Text(subtitle, style: AppTextStyle.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
