import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../home/home_page.dart';
import '../my_trips/my_trips_page.dart';
import '../my_trips/widgets/trip_details_widget.dart';
import '../profile/profile_page.dart';
import 'main_shell.dart';

import '../create_account/create_account_page.dart';
import '../login/login_page.dart';
import '../property/property_book_now_widget.dart';
import '../property/property_details_widget.dart';
import '../property/property_review_widget.dart';
import '../property/property_search_widget.dart';
import 'route_path.dart';

//  루트 네비게이터 키 생성
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// 셸 라우트용 네비게이터 키 생성
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainShell(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/my_trips',
          builder: (BuildContext context, GoRouterState state) {
            return const MyTripsPage();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: RoutePath.login,
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutePath.createAccount,
      name: 'create_account',
      builder: (context, state) => const CreateAccountPage(),
    ),
    GoRoute(
      path: RoutePath.propertyDetails,
      name: 'property_details',
      builder: (context, state) => const PropertyDetailsWidget(),
    ),
    GoRoute(
      path: RoutePath.propertySearch,
      name: 'property_search',
      builder: (context, state) => const PropertySearchWidget(),
    ),
    GoRoute(
      path: RoutePath.propertyReview,
      name: 'property_review',
      builder: (context, state) => const PropertyReviewWidget(),
    ),
    GoRoute(
      path: RoutePath.propertyBookNow,
      name: 'property_book_now',
      builder: (context, state) => const PropertyBookNowWidget(),
    ),
    GoRoute(
      path: RoutePath.tripDetails,
      name: 'trip_details',
      builder: (context, state) => const TripDetailsWidget(),
    ),
  ],
);