import 'package:bloc/bloc.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository})
      : super(const AuthState.unauthenticated()) {
    on<AuthEvent>((events, emit) async {
      await events.map(
          logOut: (event) async {
            authRepository.storeUserToken('');
            emit(const AuthState.unauthenticated());
          },
          checkAuthStatus: (event) async {
            emit(const AuthState.loading());
            final result = await authRepository.getCurrentToken();
            result.fold((l) {
              emit(const AuthState.unauthenticated());
            }, (r) {
              if (r != null && r.isNotEmpty) {
                emit(const AuthState.authenticated());
              } else {
                emit(const AuthState.unauthenticated());
              }
            });
          },
          authenticated: (event) async {
            emit(const AuthState.authenticated());
          });
    });
  }
}
