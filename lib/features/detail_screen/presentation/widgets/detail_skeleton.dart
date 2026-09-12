import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:shimmer/shimmer.dart';

class DetailSkeleton extends StatelessWidget {
  const DetailSkeleton({super.key});

  Widget _box({
    required double width,
    required double height,
    double borderRadius = 8,
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
    return Shimmer.fromColors(
      baseColor: AppColors.outline,
      highlightColor: AppColors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.sm),
            _box(
              width: double.infinity,
              height: 280,
              borderRadius: AppSpacing.lg,
            ),
            const SizedBox(height: AppSpacing.lg),
            for (var i = 0; i < 3; i++) ...[
              _box(width: double.infinity, height: 26),
              const SizedBox(height: AppSpacing.xs),
            ],
            const SizedBox(height: AppSpacing.md),
            _box(width: 120, height: 28),
            const SizedBox(height: AppSpacing.md),
            for (var i = 0; i < 2; i++) ...[
              _box(width: double.infinity, height: 14),
              const SizedBox(height: AppSpacing.xs),
            ],
            const SizedBox(height: AppSpacing.xl),
            _box(
              width: double.infinity,
              height: 120,
              borderRadius: AppSpacing.lg,
            ),
          ],
        ),
      ),
    );
  }
}
