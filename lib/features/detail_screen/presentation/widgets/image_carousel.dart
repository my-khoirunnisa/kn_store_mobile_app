import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/widgets/custom_network_image.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key, required this.targetProduct});

  final Product targetProduct;

  @override
  Widget build(BuildContext context) {
    final images = targetProduct.images.isNotEmpty
        ? targetProduct.images
        : (targetProduct.thumbnail.isNotEmpty
              ? [targetProduct.thumbnail]
              : <String>[]);

    if (images.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.md),
          border: Border.all(color: AppColors.outline),
        ),
        child: const CustomNetworkImage(imageUrl: null, iconSize: 64),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: images.length > 1
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                final imageUrl = images[index];
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.md),
                  child: _buildImageBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    imageUrl: imageUrl,
                  ),
                );
              },
            )
          : _buildImageBox(
              width: MediaQuery.of(context).size.width,
              imageUrl: images.first,
            ),
    );
  }

  static Widget _buildImageBox({
    required double width,
    required String? imageUrl,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: AppColors.outline),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: CustomNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        iconSize: 48,
      ),
    );
  }
}
