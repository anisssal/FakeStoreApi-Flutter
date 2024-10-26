import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/auth/login_screen.dart';
import 'package:flutter_fakestoreapi/presentation/products/products_screen.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

 appRouter(AuthBloc authBloc) => GoRouter(
  initialLocation: RoutePath.home,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RoutePath.home,
      name: RouteName.home.name,
      builder: (context, state) =>  const ProductScreen(),
    ),
    GoRoute(
      path: RoutePath.login,
      name: RouteName.login.name,
      builder: (context, state) =>   LoginScreen.route(),
    )


  ],
  refreshListenable: StreamToListenable([authBloc.stream]),
  // Changes on the listenable will cause the router to refresh its route
  redirect: (context, state) {
    final isAuthenticated = authBloc.state is AuthAuthenticated;
    final isUnAuthenticated = authBloc.state is AuthUnauthenticated;

    // Redirect to the login page if the user is not authenticated, and if authenticated, do not show the login page
    if (isUnAuthenticated && !state.matchedLocation.contains(RoutePath.login)) {
      return RoutePath.login;
    }
    // Redirect to the home page if the user is authenticated
    else if (isAuthenticated) {
      return RoutePath.home;
    }
    return null;
  },
);


// for convert stream to listenable
class StreamToListenable extends ChangeNotifier {
  late final List<StreamSubscription> subscriptions;

  StreamToListenable(List<Stream> streams) {
    subscriptions = [];
    for (var e in streams) {
      var s = e.asBroadcastStream().listen(_tt);
      subscriptions.add(s);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (var e in subscriptions) {
      e.cancel();
    }
    super.dispose();
  }

  void _tt(event) => notifyListeners();
}
