import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/theme/theme.dart';
import 'package:flutter_fakestoreapi/core/utils/contants.dart';
import 'package:flutter_fakestoreapi/core/utils/environments.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/cart/bloc/cart_bloc.dart';
import 'package:flutter_fakestoreapi/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment(flavor: 'development');
  await Hive.initFlutter();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        enableScaleText: () => false,
        splitScreenMode: false,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              diContainer<AuthBloc>()
                ..add(const AuthEvent.checkAuthStatus()),
            ),
            BlocProvider(
              create: (context) => diContainer<CartBloc>()..add(const CartEvent.getCartItems()),
            ),
          ],
          child: FakeStoreApiApp(),
        ));
  }
}

class FakeStoreApiApp extends StatelessWidget {

  FakeStoreApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Constants.appName,
      theme: appTheme,
      routerConfig: appRouter(context.read<AuthBloc>()),
    );
  }
}
