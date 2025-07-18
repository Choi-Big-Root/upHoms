import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'service_locator.dart';
import 'core/constants.dart';
import 'core/custom/custom_theme.dart';

import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';

Future<void> main() async {
  await dotenv.load();
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppConstants.themeNotifier,
      builder: (_, ThemeMode mode, _) {
        return ScreenUtilInit(
          builder: (context, child) => MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: customTextTheme(ThemeColors.light),
              extensions: <ThemeExtension<dynamic>>[ThemeColors.light],
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme: customTextTheme(ThemeColors.dark),
              extensions: <ThemeExtension<dynamic>>[ThemeColors.dark],
            ),
            themeMode: mode,
          ),
          designSize: const Size(393, 852),
        );
      },
    );
  }
}
