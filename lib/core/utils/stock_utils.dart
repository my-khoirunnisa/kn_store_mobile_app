import 'package:flutter/material.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';

class StockUtils {
  StockUtils._();

  static const int lowStockThreshold = 10;

  static bool isLowStock(int stock) => stock < lowStockThreshold;

  static String getStockText(int stock) {
    if (isLowStock(stock)) {
      return "Low Stock ($stock left)";
    }
    return "In Stock ($stock available)";
  }

  static Color getStockDotColor(int stock) {
    return isLowStock(stock) ? AppColors.error : AppColors.success;
  }

  static Color getStockTextColor(int stock) {
    return isLowStock(stock) ? AppColors.error : AppColors.neutral;
  }
}
