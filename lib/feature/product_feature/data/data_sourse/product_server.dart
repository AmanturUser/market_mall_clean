import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/product_entity.dart';

abstract interface class IProductDataSourse {
  Future<List<ProductModel>> loadProducts();
}

@injectable
class ProductDataSourse implements IProductDataSourse {
  final url = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> loadProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List<ProductModel> products = [];
      final jsonData = jsonDecode(response.body);
      for (var product in jsonData) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    } else {
      print('error');
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }
}
