import 'package:bloc/bloc.dart';
import 'package:flutter_fakestoreapi/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const AuthState.unauthenticated()) {
    on<AuthEvent>((events, emit) async {
      await events.map(
          logOut: (event) async{

          },
          checkAuthStatus: (event) {  },
          authenticated : (event)async{
            emit(const AuthState.authenticated());
          }
      );
    });
  }

}
