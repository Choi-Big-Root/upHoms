import 'package:go_router/go_router.dart';

import '../create_account/create_account_page.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import '../property/property_book_now_widget.dart';
import '../property/property_details_widget.dart';
import '../property/property_review_widget.dart';
import '../property/property_search_widget.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
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
      path: RoutePath.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
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
  ],
  initialLocation: '/home', //UI 작업이 완료되면 /login 고정.
);
