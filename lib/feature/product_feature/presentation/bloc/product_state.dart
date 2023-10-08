part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class LoadingProductState extends ProductState{
  @override
  List<Object> get props=>[];
}

class LoadedProductState extends ProductState{
  final List<ProductModel> products;
  LoadedProductState({required this.products});
  @override
  List<Object> get props=>[products];
}

class ErrorProductState extends ProductState{
  final Object error;
  ErrorProductState({required this.error});
  @override
  List<Object> get props=>[error];
}
