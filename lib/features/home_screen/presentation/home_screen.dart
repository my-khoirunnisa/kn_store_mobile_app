import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/core/theme/app_spacing.dart';
import 'package:kn_store_mobile_app/core/widgets/under_development_bottomsheet.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/app_bar_home.dart';
import 'package:kn_store_mobile_app/features/home_screen/presentation/widgets/app_search_bar.dart';
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
}
