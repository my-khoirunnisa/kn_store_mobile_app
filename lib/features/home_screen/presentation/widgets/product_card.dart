import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:kn_store_mobile_app/core/utils/price_utils.dart';
import 'package:kn_store_mobile_app/core/utils/stock_utils.dart';
import 'package:kn_store_mobile_app/core/widgets/custom_network_image.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isListView;
  final VoidCallback onAddToCart;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.isListView = false,
    required this.onAddToCart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.lg),
          border: Border.all(color: AppColors.outline.withValues(alpha: 0.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: isListView
            ? _buildListContent(onTapCart: onAddToCart)
            : _buildGridContent(onTapCart: onAddToCart),
      ),
    );
  }

  Widget _buildGridContent({required VoidCallback onTapCart}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageBox(height: 125),
        const SizedBox(height: AppSpacing.md),
        _buildTitle(),
        const SizedBox(height: AppSpacing.xs),
        _buildRatingRow(),
        const Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: AppSpacing.sm),
          child: Divider(thickness: 0.5, height: 1, color: AppColors.outline),
        ),
        _buildPriceRow(),
        const SizedBox(height: 2),
        _buildShippingInfo(),
        const Spacer(),
        _buildAddToCartButton(onTapCart: onTapCart),
      ],
    );
  }

  Widget _buildListContent({required VoidCallback onTapCart}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 120, child: _buildImageBox(height: 130)),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              const SizedBox(height: 4),
              _buildRatingRow(),
              const SizedBox(height: AppSpacing.sm),
              _buildPriceRow(),
              const SizedBox(height: AppSpacing.sm),
              _buildAddToCartButton(onTapCart: onTapCart),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      product.title,
      style: AppTextStyle.title.copyWith(fontSize: 13, height: 1.2),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: AppColors.primary, size: 15),
        const SizedBox(width: 2),
        Text(
          product.rating.toStringAsFixed(2),
          style: AppTextStyle.caption.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          PriceUtils.formatPrice(product.price),
          style: AppTextStyle.h3.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
        if (product.discountPercentage > 0) ...[
          const SizedBox(width: 6),
          Text(
            PriceUtils.formatOriginalPrice(
              product.price,
              product.discountPercentage,
            ),
            style: AppTextStyle.bodySmall.copyWith(
              decoration: TextDecoration.lineThrough,
              color: AppColors.lightGrey,
              fontSize: 11,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildShippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const PhosphorIcon(
              PhosphorIcons.truck,
              size: 13,
              color: AppColors.lightGrey,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                product.shippingInformation,
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.neutral,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddToCartButton({required VoidCallback onTapCart}) {
    return GestureDetector(
      onTap: onTapCart,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PhosphorIcon(
              PhosphorIcons.bagBold,
              size: 15,
              color: AppColors.secondary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Add to Bag',
              style: AppTextStyle.subtitle.copyWith(
                color: AppColors.secondary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBox({required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: CustomNetworkImage(
                imageUrl: product.thumbnail,
                fit: BoxFit.contain,
                iconSize: 36,
              ),
            ),
          ),
          Positioned(
            bottom: AppSpacing.sm,
            left: AppSpacing.xs,
            right: AppSpacing.xs,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(AppSpacing.xxl),
                  border: Border.all(
                    color: AppColors.outline.withValues(alpha: 0.5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: StockUtils.getStockDotColor(product.stock),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        StockUtils.getStockText(product.stock),
                        style: AppTextStyle.caption.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: StockUtils.getStockTextColor(product.stock),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
