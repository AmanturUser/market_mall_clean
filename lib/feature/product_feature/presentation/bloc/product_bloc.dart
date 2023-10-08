import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_case/load_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final LoadProducts loadProducts;
  ProductBloc({required this.loadProducts}) : super(ProductInitial()) {
    on<LoadProductEvent>(_loadProducts);
  }

  _loadProducts(LoadProductEvent event,Emitter emit)async{
    emit(LoadingProductState());
    final either=await loadProducts.call(NoParams());
    either.fold((error) => emit(ErrorProductState(error: error!)), (products){
      print('len of products ${products.length}');
      emit(LoadedProductState(products: products));
    });
  }
}
