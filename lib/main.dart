import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kn_store_mobile_app/core/routes/app_router.dart';
import 'package:kn_store_mobile_app/core/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
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
