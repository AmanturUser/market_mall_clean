import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/product_entity.dart';
import '../repository/repository.dart';

@injectable
class LoadProducts extends UseCase<List<ProductModel>,NoParams>{
  final ProductRepository productRepository;
  LoadProducts({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async{
    return await productRepository.loadProducts();
  }
}