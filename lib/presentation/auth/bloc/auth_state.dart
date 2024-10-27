part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthCheckLoading;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.authenticated() = AuthAuthenticated;
}
