import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    this.icon = PhosphorIcons.magnifyingGlass,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCircleIcon(icon: icon, size: 80),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'No Products Found',
            style: AppTextStyle.h3.copyWith(color: AppColors.secondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'We couldn\'t find anything matching your request.',
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.neutral),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: AppSpacing.xl),
            _actionButton(actionLabel: actionLabel!, onAction: onAction!),
          ],
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

  static Widget _actionButton({
    required VoidCallback onAction,
    required String actionLabel,
  }) {
    return ElevatedButton(
      onPressed: onAction,
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
      child: Text(actionLabel, style: AppTextStyle.button),
    );
  }
}
