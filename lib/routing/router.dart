import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/auth/login_screen.dart';
import 'package:flutter_fakestoreapi/presentation/product/product_detail/product_detail_screen.dart';
import 'package:flutter_fakestoreapi/presentation/product/products/products_screen.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

 GoRouter appRouter(AuthBloc authBloc) => GoRouter(
  initialLocation: RoutePath.home,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RoutePath.home,
      name: RouteName.home.name,
      builder: (context, state) =>   ProductScreen.route(),
    ),
    GoRoute(
      path: RoutePath.login,
      name: RouteName.login.name,
      builder: (context, state) =>   LoginScreen.route(),
    ),
    GoRoute(
      path: RoutePath.productDetail,
      name: RouteName.productDetail.name,
      builder: (context, state) =>   ProductDetailScreen.route(state),
    ),


  ],
  refreshListenable: StreamToListenable([authBloc.stream]),
  redirect: (context, state) {
    final isAuthenticated = authBloc.state is AuthAuthenticated;
    final isUnAuthenticated = authBloc.state is AuthUnauthenticated;

    if (isUnAuthenticated && !state.matchedLocation.contains(RoutePath.login)) {
      return RoutePath.login;
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
