import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/routes/app_router.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/widgets/empty_state.dart';
import 'package:kn_store_mobile_app/core/widgets/error_state.dart';
import 'package:kn_store_mobile_app/core/widgets/under_development_bottomsheet.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/app_bar_home.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/app_search_bar.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/grid_layout.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/product_card.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/product_skeleton.dart';
import 'package:kn_store_mobile_app/features/home_screen/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<HomeProvider>().getInitialProducts();
      }
    });
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (mounted) {
        context.read<HomeProvider>().getMoreProducts();
      }
    }
  }

  void _onSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<HomeProvider>().getProductBySearch(query: query);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return RefreshIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.white,
              onRefresh: () async {
                _searchController.clear();
                await context.read<HomeProvider>().getInitialProducts();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarHome(
                      totalCart: 8,
                      onTapCart: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return const UnderDevelopmentBottomsheet();
                          },
                        );
                      },
                      onTapProfile: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return const UnderDevelopmentBottomsheet();
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSearchBar(
                            controller: _searchController,
                            onChanged: _onSearch,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          _buildBodyContent(provider),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBodyContent(HomeProvider provider) {
    if (provider.isLoading) {
      return _buildSkeletonSection();
    }

    if (provider.error != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
        child: ErrorState(onAction: () => provider.getInitialProducts()),
      );
    }

    if (provider.products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
        child: EmptyState(
          actionLabel: _searchController.text.isNotEmpty
              ? 'Clear Search'
              : 'Refresh',
          onAction: () {
            _searchController.clear();
            provider.getInitialProducts();
          },
        ),
      );
    }

    return _buildProductSection(provider);
  }

  Widget _buildSkeletonSection() {
    return Column(
      children: [
        GridLayout(
          isGridView: _isGridView,
          itemCount: 6,
          onViewModeChanged: (isGrid) => setState(() => _isGridView = isGrid),
        ),
        const SizedBox(height: AppSpacing.md),
        _buildProductContainer(
          itemCount: 6,
          itemBuilder: (context, index) =>
              ProductSkeleton(isListView: !_isGridView),
        ),
      ],
    );
  }

  Widget _buildProductSection(HomeProvider provider) {
    final products = provider.products;
    return Column(
      children: [
        GridLayout(
          isGridView: _isGridView,
          itemCount: products.length,
          onViewModeChanged: (isGrid) => setState(() => _isGridView = isGrid),
        ),
        const SizedBox(height: AppSpacing.md),
        _buildProductContainer(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              isListView: !_isGridView,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouter.detailScreen,
                  arguments: product.id,
                );
              },
              onAddToCart: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return const UnderDevelopmentBottomsheet();
                  },
                );
              },
            );
          },
        ),
        if (provider.isLoadingMore) _buildLoadMoreIndicator(),
      ],
    );
  }

  Widget _buildProductContainer({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    if (_isGridView) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.md,
          mainAxisSpacing: AppSpacing.md,
          childAspectRatio: 0.54,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
      itemBuilder: itemBuilder,
    );
  }

  Widget _buildLoadMoreIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Center(
        child: CircularProgressIndicator(color: AppColors.secondary),
      ),
    );
  }
}
