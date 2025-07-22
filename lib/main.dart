import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uphoms/presentation/bloc/user/user_bloc.bloc.dart';
import 'package:uphoms/presentation/cubit/message_cubit.dart';
import 'presentation/bloc/property/property_bloc.bloc.dart';
import 'presentation/bloc/review/review_bloc.bloc.dart';
import 'presentation/bloc/trip/trip_bloc.bloc.dart';
import 'service_locator.dart';
import 'core/constants.dart';
import 'core/custom/custom_theme.dart';

import 'core/theme/theme_data.dart';
import 'presentation/routes/routes.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


Future<void> main() async {
  await dotenv.load();
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<UserBloc>()), //User 관련
        BlocProvider(create: (context) => locator<PropertyBloc>()), // property 관련
        BlocProvider(create: (context) => locator<ReviewBloc>()), // review 관련
        BlocProvider(create: (context) => locator<MessageCubit>()), // snackbar message 관련
        BlocProvider(create: (context) => locator<TripBloc>()),
      ],
      child: ValueListenableBuilder(
        valueListenable: AppConstants.themeNotifier,
        builder: (_, ThemeMode mode, _) {
          return ScreenUtilInit(
            builder: (context, child) => MaterialApp.router(
              routerConfig: router,
              scaffoldMessengerKey: scaffoldMessengerKey,
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
      ),
    );
  }
}
