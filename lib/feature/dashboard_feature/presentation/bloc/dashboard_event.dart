part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class GetCategoriesEvent extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class GetProductsEvent extends DashboardEvent {
  @override
  List<Object> get props => [];
}