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
    final authBloc = BlocProvider.of<AuthBloc>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool showPassword = false;


    phoneField() {
      return Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFF225196),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color(0xFF225196),
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Color(0xFF225196).withOpacity(0.5),
            ),
            hintText: 'Email',
            border: InputBorder.none,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(
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
    /*ipField() {
      return Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFF225196),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: ip,
          style: TextStyle(
            color: Color(0xFF225196),
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Color(0xFF225196).withOpacity(0.5),
            ),
            hintText: 'IP adress',
            border: InputBorder.none,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 11, right: 13, bottom: 12),
                child: Icon(
                  Icons.settings,
                  color: Color(0xFF225196),
                  size: 19,
                )),
          ),
        ),
      );
    }*/
    passwordField() {
      return Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFF225196),
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
                  color: Color(0xFF225196),
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xFF225196).withOpacity(0.5),
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
            ),
            IconButton(
              onPressed: () {},
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
      );
    }
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
              SizedBox(
                height: 23,
              ),
              phoneField(),
              SizedBox(
                height: 15,
              ),
              passwordField(),
              SizedBox(
                height: 20,
              ),
              // ipField(),
              SizedBox(
                height: 20,
              ),
              BlocBuilder(
                bloc: authBloc,
                builder: (context, state) {
                  if(state is SuccessfullySignInState){
                    AutoRouter.of(context).replace(const ProductListRoute());
                  }
                  if(state is LoadingAuthState){
                    return Ink(
                      width: 163,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: CircularProgressIndicator()),
                    );
                  }
                  if(state is ErrorAuthState){
                    return Column(
                      children: [

                        Container(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Center(
                            child: Text(
                              '${state.error.toString()}',
                              style: TextStyle(color: Color(0xFF225196), fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            authBloc.add(SignInEvent(userAuth: UserAuth(email: email.text,password: password.text)));
                          },
                          child: Ink(
                            width: 163,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color(0xFF225196),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
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
                          color: Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                            'Войти',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              SizedBox(height: 80),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Не можете войти?',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 12),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(const SignUpRoute());
                  },
                  child: Text(
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
