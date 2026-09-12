import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:shimmer/shimmer.dart';

class ProductSkeleton extends StatelessWidget {
  final bool isListView;

  const ProductSkeleton({super.key, this.isListView = false});

  Widget _box({
    required double width,
    required double height,
    double borderRadius = 6,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardContent = isListView ? _buildListView() : _buildGridView();

    return Shimmer.fromColors(
      baseColor: AppColors.outline,
      highlightColor: AppColors.white,
      child: cardContent,
    );
  }

  Widget _buildListView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          _box(width: 110, height: 110, borderRadius: AppSpacing.md),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(width: 80, height: 12),
                const SizedBox(height: 8),
                _box(width: double.infinity, height: 16),
                const SizedBox(height: 8),
                _box(width: 100, height: 12),
                const SizedBox(height: 12),
                _box(width: 60, height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.lg),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
      ),
      padding: const EdgeInsets.all(AppSpacing.sm + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _box(
            width: double.infinity,
            height: 125,
            borderRadius: AppSpacing.md,
          ),
          const SizedBox(height: AppSpacing.sm),
          _box(width: double.infinity, height: 14),
          const SizedBox(height: AppSpacing.xs),
          _box(width: 90, height: 12),
          const SizedBox(height: AppSpacing.xs),
          _box(width: 70, height: 16),
          const Spacer(),
          _box(width: double.infinity, height: 32, borderRadius: AppSpacing.md),
        ],
      ),
    );
  }
}
