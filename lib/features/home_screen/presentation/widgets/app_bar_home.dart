import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class AppBarHome extends StatelessWidget {
  final int totalCart;
  final VoidCallback onTapCart;
  final VoidCallback onTapProfile;

  const AppBarHome({
    super.key,
    required this.totalCart,
    required this.onTapCart,
    required this.onTapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.outline, width: 0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left side
          Row(
            spacing: AppSpacing.md,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.sm),
                child: Image.asset(
                  'lib/assets/images/app_logo.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.contain,
                ),
              ),
              Text("KN Store.", style: AppTextStyle.title),
            ],
          ),

          // right side
          Row(
            spacing: AppSpacing.xs,
            children: [
              InkWell(
                onTap: onTapCart,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.bagBold,
                        size: 24,
                        color: AppColors.secondary,
                      ),
                      Positioned(
                        right: -8,
                        top: -8,
                        child: Container(
                          width: 18,
                          height: 18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(AppSpacing.md),
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              totalCart.toString(),
                              style: AppTextStyle.caption.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: onTapProfile,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhosphorIcon(
                    PhosphorIcons.userBold,
                    size: 24,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
