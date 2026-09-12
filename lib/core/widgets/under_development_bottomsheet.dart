import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class UnderDevelopmentBottomsheet extends StatelessWidget {
  const UnderDevelopmentBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.outline, width: 0.5)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSpacing.md),
          _buildCircleIcon(icon: PhosphorIcons.wrench, size: 80),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Under Development',
            style: AppTextStyle.h3.copyWith(color: AppColors.secondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'This feature is under development. Please try again later.',
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.neutral),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          _actionButton(context: context),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  static Widget _buildCircleIcon({
    required IconData icon,
    required double size,
  }) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 40, color: AppColors.primary),
    );
  }

  static Widget _actionButton({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        elevation: 0,
      ),
      child: Text("Close", style: AppTextStyle.button),
    );
  }
}
