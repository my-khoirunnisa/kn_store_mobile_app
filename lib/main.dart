import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kn_store_mobile_app/core/network/api_client.dart';
import 'package:kn_store_mobile_app/core/routes/app_router.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';
import 'package:kn_store_mobile_app/features/detail_screen/data/detail_services.dart';
import 'package:kn_store_mobile_app/features/detail_screen/providers/detail_provider.dart';
import 'package:kn_store_mobile_app/features/home_screen/data/home_services.dart';
import 'package:kn_store_mobile_app/features/home_screen/providers/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(HomeServices(ApiClient())),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProvider(DetailServices(ApiClient())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: MaterialApp(
        title: 'KN Store.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'PlusJakartaSans', useMaterial3: true),
        initialRoute: AppRouter.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scaleMediaQuery = mediaQueryData.copyWith(
            textScaler: TextScaler.noScaling,
          );
          return MediaQuery(
            data: scaleMediaQuery,
            child: Container(
              color: AppColors.secondary,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
