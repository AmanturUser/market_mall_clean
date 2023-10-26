import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/auto_route/auto_route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      AutoRouter.of(context).replace(const SignInRoute());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png',height: 228,width: 228,),
      ),
    );
  }
}
