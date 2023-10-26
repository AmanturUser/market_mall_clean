import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:market_mall_flutter_bloc/core/constants/api_constants.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/entities/dashboard_entity.dart';

abstract interface class IDashboardSourse {
  Future<Categories> getCategories();
}

@injectable
class DashboardSourse implements IDashboardSourse {

  @override
  Future<Categories> getCategories() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'Categories/Index',
    );

    var response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return Categories.fromJson(jsonDecode(response.body));
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      throw Exception(response.reasonPhrase);
    }
  }


}
