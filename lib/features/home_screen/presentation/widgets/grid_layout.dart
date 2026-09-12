import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class GridLayout extends StatelessWidget {
  final bool isGridView;
  final ValueChanged<bool> onViewModeChanged;
  final int itemCount;

  const GridLayout({
    super.key,
    required this.isGridView,
    required this.onViewModeChanged,
    this.itemCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Text("Showing $itemCount Items", style: AppTextStyle.subtitle),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.outline, width: 1),
            borderRadius: BorderRadius.circular(AppSpacing.md),
            color: AppColors.white,
          ),
          padding: const EdgeInsets.all(3),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => onViewModeChanged(true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                    color: isGridView
                        ? AppColors.secondary
                        : Colors.transparent,
                  ),
                  child: PhosphorIcon(
                    isGridView
                        ? PhosphorIcons.gridFourBold
                        : PhosphorIcons.gridFour,
                    color: isGridView ? AppColors.white : AppColors.secondary,
                    size: 16,
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => onViewModeChanged(false),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                    color: !isGridView
                        ? AppColors.secondary
                        : Colors.transparent,
                  ),
                  child: PhosphorIcon(
                    !isGridView ? PhosphorIcons.listBold : PhosphorIcons.list,
                    color: !isGridView ? AppColors.white : AppColors.secondary,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
