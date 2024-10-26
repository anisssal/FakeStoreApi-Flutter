part of 'login_cubit.dart';


enum LoginCubitStatus { initial, loading, authenticated, unauthenticated}

@freezed
class LoginState with _$LoginState {

  const factory LoginState({
    required LoginCubitStatus status ,
    required bool showPassword,
    required String username,
    required String password,

}) = _LoginState;
}

