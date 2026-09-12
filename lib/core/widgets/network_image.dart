import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class NetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double iconSize;
  final BorderRadius? borderRadius;

  const NetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.iconSize = 40,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return _buildPlaceholder();
    }

    Widget imageWidget = Image.network(
      imageUrl!,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.secondary,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
    );

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.white,
      child: Center(
        child: PhosphorIcon(
          PhosphorIcons.image,
          size: iconSize,
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
