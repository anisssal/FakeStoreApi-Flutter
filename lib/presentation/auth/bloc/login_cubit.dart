import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit({required this.authRepository}) : super(const LoginState(
    status: LoginCubitStatus.initial,
    showPassword: false,
    password: '',
    username: ''
  ));

  void logIn() async {
    emit(state.copyWith(
      status: LoginCubitStatus.loading
    ));
    final result = await authRepository.logIn(
      username: state.username,
      password: state.password,
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          status: LoginCubitStatus.unauthenticated
        ));
      },
      (token) {
        emit(state.copyWith(
            status: LoginCubitStatus.authenticated
        ));
      },
    );
  }

  void onPasswordChange(String password){
    emit(state.copyWith(
        password: password
    ));
  }
  void onUsernameChange(String username){
    emit(state.copyWith(
        username: username
    ));
  }

  void togglePasswordVisibility(){
    emit(state.copyWith(
        showPassword: !state.showPassword
    ));
  }
}
