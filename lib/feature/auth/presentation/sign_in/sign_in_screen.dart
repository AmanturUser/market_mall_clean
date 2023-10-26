import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';
import 'package:market_mall_flutter_bloc/feature/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/auto_route/auto_route.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();


    phoneField() {
      return Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFF225196),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Color(0xFF225196),
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: const Color(0xFF225196).withOpacity(0.5),
            ),
            hintText: 'Email',
            border: InputBorder.none,
            prefixIcon: const Padding(
                padding: EdgeInsets.only(
                    left: 18, top: 11, right: 13, bottom: 12),
                child: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF225196),
                  size: 19,
                )),
          ),
        ),
      );
    }
    passwordField() {
      return Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFF225196),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                controller: password,
                obscureText: true,
                obscuringCharacter: '*',
                style: const TextStyle(
                  color: Color(0xFF225196),
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: const Color(0xFF225196).withOpacity(0.5),
                  ),
                  hintText: 'Пароль',
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, top: 16, right: 13, bottom: 17),
                    child: Image.asset('assets/img/iconPassword.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
              Image.asset(
                'assets/img/logo.png',
                width: 148,
                height: 148,
              ),
              const SizedBox(
                height: 34,
              ),
              const SizedBox(
                height: 23,
              ),
              phoneField(),
              const SizedBox(
                height: 15,
              ),
              passwordField(),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder(
                bloc: authBloc,
                builder: (context, state) {
                  if(state is SuccessfullySignInState){
                    AutoRouter.of(context).replace(const DashboardRoute());
                  }
                  if(state is LoadingAuthState){
                    return Ink(
                      width: 163,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: CircularProgressIndicator()),
                    );
                  }
                  if(state is ErrorAuthState){
                    return Column(
                      children: [

                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Center(
                            child: Text(
                              state.error.toString(),
                              style: const TextStyle(color: Color(0xFF225196), fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            authBloc.add(SignInEvent(userAuth: UserAuth(email: email.text,password: password.text)));
                          },
                          child: Ink(
                            width: 163,
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color(0xFF225196),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                                child: Text(
                                  'Войти',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                )),
                          ),
                        )
                      ],
                    );
                  }
                  return InkWell(
                    onTap: () {
                      authBloc.add(SignInEvent(userAuth: UserAuth(email: email.text,password: password.text)));
                    },
                    child: Ink(
                      width: 163,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                          child: Text(
                            'Войти',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 80),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Не можете войти?',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 12),
                  )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(const SignUpRoute());
                  },
                  child: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
