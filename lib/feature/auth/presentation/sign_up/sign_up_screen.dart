import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/auto_route/auto_route.dart';
import '../../../../core/style/app_colors.dart';
import '../../domain/entities/user_auth.dart';
import '../bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController password2 = TextEditingController();
    bool showPassword = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              Image.asset(
                'assets/img/logo.png',
                width: 148,
                height: 148,
              ),
              SizedBox(
                height: 34,
              ),
              /*Text(
                'Войти через социальные сети',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF515151),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blue1,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Image.asset('assets/img/google.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blue1,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Image.asset('assets/img/facebook.png'),
                      ),
                    ),
                  ),
                ],
              ),*/
              SizedBox(
                height: 23,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Email',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 11, top: 16, right: 13, bottom: 17),
                      child: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF225196),
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      child: TextField(
                        controller: password,
                        obscureText: showPassword,
                        obscuringCharacter: '*',
                        style: TextStyle(
                          color: AppColors.blue1,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: AppColors.blue1.withOpacity(0.5),
                          ),
                          hintText: 'Введите пароль',
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 11, top: 16, right: 13, bottom: 17),
                            child: Image.asset('assets/img/iconPassword.png'),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showPassword = !showPassword;
                      },
                      icon: showPassword
                          ? Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xFF225196),
                            )
                          : Icon(
                              Icons.remove_red_eye_rounded,
                              color: Color(0xFF225196),
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: password2,
                  obscureText: showPassword,
                  obscuringCharacter: '*',
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Повторите пароль',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 11, top: 16, right: 13, bottom: 17),
                      child: Image.asset('assets/img/iconPassword.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SuccessfullySignUpState) {
                    return Text('Вы успешно регистрированы');
                  }
                  if (state is LoadingAuthState) {
                    return Ink(
                      width: 163,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is ErrorSignUpState) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              '${state.error.toString()}',
                              style: TextStyle(
                                  color: Color(0xFF225196), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            authBloc.add(SignUpEvent(
                                userAuth: UserAuth(
                                    email: email.text,
                                    password: password.text)));
                          },
                          child: Ink(
                            width: 245,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColors.blue1,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                              'Зарегистрироваться',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                          ),
                        )
                      ],
                    );
                  }

                  return InkWell(
                    onTap: () {
                      authBloc.add(SignUpEvent(
                          userAuth: UserAuth(
                              email: email.text, password: password.text)));
                    },
                    child: Ink(
                      width: 245,
                      height: 45,
                      decoration: BoxDecoration(
                          color: AppColors.blue1,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(const SignInRoute());
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(color: AppColors.blue1, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
