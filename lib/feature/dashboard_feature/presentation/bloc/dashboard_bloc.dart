import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/entities/dashboard_entity.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/use_case/get_categories.dart';

import '../../../../core/use_case/use_case.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetCategories getCategories;
  // final GetProducts getProducts;
  DashboardBloc({required this.getCategories}) : super(DashboardInitial()) {
    on<GetCategoriesEvent>(_getCategories);
    // on<GetProductsEvent>(_getProducts);
  }

  _getCategories(GetCategoriesEvent event, Emitter emit) async{
    emit(LoadingDashboardState());
    final either=await getCategories.call(NoParams());
    either.fold((error) => emit(ErrorDashboardState(error: error)), (categories) {
      print('len of list ${categories.data!.length}');
      emit(LoadedCategoriesState(categories: categories));
    });
  }

 /* _getProducts(GetProductsEvent event, Emitter emit) async{
    emit(LoadingDashboardState());
    final either=await getProducts.call(NoParams());
    either.fold((error) => emit(ErrorDashboardState(error: error)), (getProducts) {
      print('len of list ${getProducts.data!.length}');
      emit(LoadedGetProductsState(getProducts: getProducts));
    });
  }*/
}
