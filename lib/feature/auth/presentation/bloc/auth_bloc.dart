import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';

import '../../domain/use_case/sign_in.dart';
import '../../domain/use_case/sign_up.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;

  AuthBloc({required this.signIn, required this.signUp})
      : super(AuthInitial()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
  }

  _signIn(SignInEvent event, Emitter emit) async {
    final email = event.userAuth.email;
    final password = event.userAuth.password;
    emit(LoadingAuthState());
    if (email !='' && password != '') {
      final either = await signIn.call(event.userAuth);
      either
          .fold((error) => emit(ErrorAuthState(error: 'Ваши данные не верны')),
              (active) {
        if (active == true)
          emit(SuccessfullySignInState());
        else if(active==false) {
          emit(ErrorAuthState(error: 'Ваши данные не верны'));
        }
      });
    } else {
      emit(ErrorAuthState(error: 'Введите данные'));
    }
  }

  _signUp(SignUpEvent event, Emitter emit) async {
    final email = event.userAuth.email;
    final password = event.userAuth.password;
    emit(LoadingAuthState());
    if (email !='' && password != '') {
      final either = await signUp.call(event.userAuth);
      either.fold(
        (error) => emit(ErrorSignUpState(error: 'Не удалось зарегистрироваться')),
        (active) {
          if (active == true)
            emit(SuccessfullySignUpState());
          else {
            emit(ErrorSignUpState(error: 'Не удалось зарегистрироваться'));
          }
        },
      );
    } else {
      emit(ErrorSignUpState(error: 'Введите данные'));
    }
  }
}
