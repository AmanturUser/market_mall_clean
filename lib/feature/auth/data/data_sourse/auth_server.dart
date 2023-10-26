import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:market_mall_flutter_bloc/core/constants/api_constants.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';

abstract interface class IAuthSourse {
  Future<bool> signIn(UserAuth userAuth);
  Future<bool> signUp(UserAuth userAuth);
}

@injectable
class AuthSourse implements IAuthSourse {
  Future<bool> signIn(UserAuth userAuth) async {
    final signInPath = 'User/SignIn';
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: signInPath,
    );
    var json = {
      'email': userAuth.email,
      "password": userAuth.password,
    };
    print(signInPath);
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print('error');
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }

  Future<bool> signUp(UserAuth userAuth) async {
    final signUpPath = 'User/SignUp';
    var json = {
      'email': userAuth.email,
      "password": userAuth.password,
    };
    var uri=Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: signUpPath,
    );
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print('error');
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }
}
