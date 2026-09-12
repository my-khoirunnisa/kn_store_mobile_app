import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/routes/app_router.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/theme/app_text_style.dart';
import 'package:kn_store_mobile_app/core/utils/stock_utils.dart';
import 'package:kn_store_mobile_app/core/widgets/empty_state.dart';
import 'package:kn_store_mobile_app/core/widgets/error_state.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/additional_info.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/detail_skeleton.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/header_section.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/image_carousel.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/price_description.dart';
import 'package:kn_store_mobile_app/features/detail_screen/presentation/widgets/stock_notice_banner.dart';
import 'package:kn_store_mobile_app/features/detail_screen/providers/detail_provider.dart';
import 'package:kn_store_mobile_app/features/home_screen/domain/product_model.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int productId;

  const DetailScreen({super.key, required this.productId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int? _productId;

  @override
  void initState() {
    super.initState();
    _productId = widget.productId;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<DetailProvider>().fetchProductDetail(_productId ?? 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Product Detail', style: AppTextStyle.h3),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Consumer<DetailProvider>(
        builder: (context, provider, _) => _buildBodyContent(provider),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBodyContent(DetailProvider provider) {
    if (provider.isLoading && provider.product == null) {
      return const DetailSkeleton();
    }

    if (provider.error != null && provider.product == null) {
      return Center(
        child: ErrorState(
          onAction: () {
            if (_productId != null) {
              provider.fetchProductDetail(_productId!);
            }
          },
        ),
      );
    }

    final targetProduct = provider.product;
    if (targetProduct == null) {
      return EmptyState(
        actionLabel: 'Back to Home',
        onAction: () =>
            Navigator.pushReplacementNamed(context, AppRouter.homeScreen),
      );
    }

    return _buildProductContent(provider, targetProduct);
  }

  Widget _buildProductContent(DetailProvider provider, Product targetProduct) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        spacing: AppSpacing.sm,
        children: [
          const SizedBox(height: AppSpacing.sm),
          ImageCarousel(targetProduct: targetProduct),
          const SizedBox(height: AppSpacing.xs),
          HeaderSection(targetProduct: targetProduct),
          const SizedBox(height: AppSpacing.xs),
          PriceDescription(targetProduct: targetProduct),
          if (StockUtils.isLowStock(targetProduct.stock)) ...[
            const SizedBox(height: AppSpacing.xs),
            const StockNoticeBanner(),
          ],
          const SizedBox(height: AppSpacing.xs),
          AdditionalInfo(targetProduct: targetProduct),
          const SizedBox(height: AppSpacing.xxl * 2),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      color: AppColors.white,
      elevation: 8,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: FilledButton.icon(
          icon: const PhosphorIcon(
            PhosphorIcons.bagBold,
            color: AppColors.secondary,
          ),
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.lg),
            ),
          ),
          label: Text(
            "Add to Bag",
            style: AppTextStyle.subtitle.copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}
