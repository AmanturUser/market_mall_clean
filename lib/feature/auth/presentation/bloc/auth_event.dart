part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final UserAuth userAuth;
  SignInEvent({
    required this.userAuth
  });

  @override
  List<Object?> get props => [userAuth];
}

class SignUpEvent extends AuthEvent {
  final UserAuth userAuth;
  SignUpEvent({
    required this.userAuth
  });

  @override
  List<Object?> get props => [userAuth];
}
