import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/warranty_card.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key, required this.targetProduct});

  final Product targetProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.md,
      children: [
        WarrantyCard(
          title: targetProduct.warrantyInformation,
          subtitle: "Protected against manufacturer defects",
          icon: PhosphorIcons.sealCheck,
        ),
        WarrantyCard(
          title: targetProduct.shippingInformation,
          subtitle: "Fast delivery to your doorstep",
          icon: PhosphorIcons.truck,
        ),
        WarrantyCard(
          title: targetProduct.returnPolicy,
          subtitle: "Hassle-free return & full refund guarantee",
          icon: PhosphorIcons.arrowUUpLeft,
        ),
      ],
    );
  }
}
