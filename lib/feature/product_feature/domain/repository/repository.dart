import 'package:dartz/dartz.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../entities/product_entity.dart';

abstract interface class ProductRepository{
  Future<Either<Failure,List<ProductModel>>> loadProducts();
}