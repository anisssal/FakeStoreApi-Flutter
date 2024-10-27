import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/injection.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_fakestoreapi/presentation/auth/bloc/login_cubit.dart';
import 'package:flutter_fakestoreapi/presentation/auth/components/login_form.dart';
import 'package:flutter_fakestoreapi/presentation/components/components.dart';
import 'package:flutter_fakestoreapi/routing/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../core/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen._({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static route() {
    return BlocProvider(
      create: (context) => diContainer<LoginCubit>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthCheckLoading) {
            return Container(
              height: 1.sh,
              width: 1.sw,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return LoginScreen._();
        },
      ),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    logDebug.i("tes ${context.read<AuthBloc>().state}");

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == LoginCubitStatus.authenticated) {
          context.read<AuthBloc>().add(const AuthEvent.authenticated());
          GoRouter.of(context).pushReplacement(RoutePath.products);
        }
        if (state.status == LoginCubitStatus.unauthenticated) {
          toastification.show(
            context: context,
            style: ToastificationStyle.flatColored,
            title: const Text('Username or password incorrect'),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 2),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight + (defaultPadding * 2),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  width: 0.6.sw,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with username & username available on fakestoreapi",
                    ),
                    const SizedBox(height: defaultPadding),
                    LogInForm(formKey: _formKey),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text("Forgot password"),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return LoadingButton(
                            width: double.infinity,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginCubit>().logIn();
                              }
                            },
                            isLoading: state.status == LoginCubitStatus.loading,
                            content: const Text("Log in"));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Sign up"),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
