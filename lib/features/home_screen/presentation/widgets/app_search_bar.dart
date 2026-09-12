import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class AppSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const AppSearchBar({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        hintText: 'Search any products in here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.lg),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.lg),
          borderSide: const BorderSide(color: AppColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.lg),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Icon(
            PhosphorIcons.magnifyingGlass,
            color: AppColors.lightGrey,
            size: 16,
          ),
        ),
        hintStyle: AppTextStyle.bodyMedium.copyWith(color: AppColors.lightGrey),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}
