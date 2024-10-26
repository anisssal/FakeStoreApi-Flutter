part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.logOut() = _LogOut;
  const factory AuthEvent.authenticated() = _Authenticated;

}
