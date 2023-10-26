import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:market_mall_flutter_bloc/core/auto_route/auto_route.dart';


class EmailVerify extends StatefulWidget {
  final email;
  const EmailVerify({Key? key,required this.email}) : super(key: key);

  @override
  _EmailVerifyState createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  //late Future<EmailModel> futureEmailVerify;
  @override
  void initState() {
    super.initState();
    //futureEmailVerify = fetchEmail(widget.email);
  }
  TextEditingController kod=TextEditingController();

 /* void showToast() => Fluttertoast.showToast(
      msg: "Регистрация завершено!",
      fontSize: 18,
      gravity: ToastGravity.BOTTOM);*/

  /*void cancelToast(String msgError) => Fluttertoast.showToast(
      msg: msgError,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white);*/

  @override
  Widget build(BuildContext context) {
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
                    width: 108,
                    height: 108,
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
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
                      controller: kod,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Color(0xFF225196),
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Color(0xFF225196).withOpacity(0.5),
                        ),
                        hintText: 'Код',
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, top: 11, right: 13, bottom: 12),
                          child: Icon(Icons.password_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async{

                      if(kod.text!=null){
                        bool ans= true;/*await AuthClient().postConfirmEmail(widget.email, kod.text);*/
                        if(ans){
                          // showToast();
                          AutoRouter.of(context).replace(const SignInRoute());
                        }else{
                          // cancelToast('Неправильный код!');
                        }}else{
                        // cancelToast('Введите код!');
                      }
                      },
                    child: Ink(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xFF225196),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                            'Подтвердить',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).replace(const SignInRoute());
                      },
                      child: Text(
                        'Хотите войти?',
                        style: TextStyle(color: Color(0xFF225196), fontSize: 12),
                      )),
                  SizedBox(height: 20,),
                  InkWell(
                      onTap: () {
                        AutoRouter.of(context).replace(const SignUpRoute());
                      },
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Color(0xFF225196), fontSize: 16),
                      )),
                ],
              ),
            )
        ),
      );
  }
}
