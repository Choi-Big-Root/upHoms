import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import '../../domain/model/property/property_model.dart';
import '../bloc/user/user_bloc.bloc.dart';
import '../home/home_page.dart';
import '../my_trips/my_trips_page.dart';
import '../my_trips/widgets/my_trip_details_widget.dart';
import '../profile/profile_change_password.dart';
import '../profile/profile_edit.dart';
import '../profile/profile_my_bookings.dart';
import '../profile/profile_my_property.dart';
import '../profile/profile_page.dart';
import '../profile/profile_payment_edit.dart';
import '../profile/property/widgets/property_editor_wrapper.dart';
import '../profile/property/widgets/property_step1_widget.dart';
import '../profile/property/widgets/property_step2_widget.dart';
import '../profile/property/widgets/property_step3_widget.dart';
import 'main_shell.dart';

import '../create_account/create_account_page.dart';
import '../login/login_page.dart';
import '../trip/trip_book_now_widget.dart';
import '../trip/trip_details_widget.dart';
import '../trip/trip_review_widget.dart';
import '../trip/trip_search_widget.dart';
import 'route_path.dart';

//  루트 네비게이터 키 생성
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// 셸 라우트용 네비게이터 키 생성
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final logger = Logger();
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
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                var userId;
                state.when(
                  initial: () {},
                  loading: () {},
                  success: (data) {
                    userId = data.uid.toString();
                  },
                  error: (msg) {},
                );
                return MyTripsPage(userId: userId);
              },
            );
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
      builder: (context, state) {
        return const LoginPage();
      },
    ),

    GoRoute(
      path: RoutePath.createAccount,
      name: 'create_account',
      builder: (context, state) {
        return const CreateAccountPage();
      },
    ),

    GoRoute(
      path: RoutePath.myTripDetails,
      name: 'my_trip_details',
      builder: (context, state) {
        final tripId = {'tripId': state.uri.queryParameters['tripId']};
        final mode = state.uri.queryParameters['mode'];
        return MyTripDetailsWidget(tripId: tripId,mode:mode);
      },
    ),

    GoRoute(
      path: RoutePath.tripSearch,
      name: 'trip_search',
      builder: (context, state) {
        final searchText = {
          'searchText': state.uri.queryParameters['searchText'],
        };
        return TripSearchWidget(searchText: searchText);
      },
    ),
    GoRoute(
      path: RoutePath.tripReview,
      name: 'trip_review',
      builder: (context, state) => const TripReviewWidget(),
    ),
    GoRoute(
      path: RoutePath.tripBookNow,
      name: 'trip_book_now',
      builder: (context, state) {
        return const TripBookNowWidget();
      },
    ),
    GoRoute(
      path: RoutePath.tripDetails,
      name: 'trip_details',
      builder: (context, state) {
        final propertyId = {
          'propertyId': state.uri.queryParameters['propertyId'],
        };
        final kind = state.uri.queryParameters['kind'];
        final searchText = state.uri.queryParameters['searchText'];
        final tripId = state.uri.queryParameters['tripId'];
        final mode = state.uri.queryParameters['mode'];
        return TripDetailsWidget(
          propertyId: propertyId,
          kind: kind,
          searchText: searchText ?? '',
          tripId: tripId ?? '',
          mode: mode ?? '',
        );
      },
    ),

    GoRoute(
      path: RoutePath.profileEdit,
      name: 'profile_edit',
      builder: (context, state) => const ProfileEdit(),
    ),
    GoRoute(
      path: RoutePath.profilePaymentEdit,
      name: 'profile_payment_edit',
      builder: (context, state) => const ProfilePaymentEdit(),
    ),
    GoRoute(
      path: RoutePath.profileChangePassword,
      name: 'profile_change_password',
      builder: (context, state) => const ProfileChangePassword(),
    ),
    GoRoute(
      path: RoutePath.profileMyProperty,
      name: 'profile_my_property',
      builder: (context, state) => const ProfileMyProperty(),
    ),
    GoRoute(
      path: RoutePath.profileMyBookings,
      name: 'profile_my_bookings',
      builder: (context, state) {
        final hostId = state.uri.queryParameters['hostId'];
        return ProfileMyBookings(hostId:hostId!);
      },
    ),

    GoRoute(
      path: RoutePath.propertyEditorWrapper,
      name: 'property_editor_wrapper',
      builder: (context, state) {
        final PropertyModel? property = state.extra as PropertyModel?;
        return  PropertyEditorWrapper(property:property );
      }
    ),
    GoRoute(
      path: RoutePath.propertyStep1Widget,
      name: 'property_step1_widget',
      builder: (context, state) => const PropertyStep1Widget(),
    ),
    GoRoute(
      path: RoutePath.propertyStep2Widget,
      name: 'property_step2_widget',
      builder: (context, state) {
        final PropertyModel? property = state.extra as PropertyModel?;
        return  PropertyStep2Widget(property:property );
      },
    ),
    GoRoute(
      path: RoutePath.propertyStep3Widget,
      name: 'property_step3_widget',
      builder: (context, state) {
        final PropertyModel? property = state.extra as PropertyModel?;
        return  PropertyStep3Widget(property:property );
      },
    ),
  ],
);
