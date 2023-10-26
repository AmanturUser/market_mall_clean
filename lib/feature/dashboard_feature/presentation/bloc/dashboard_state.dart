part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class LoadingDashboardState extends DashboardState{
  @override
  List<Object> get props=>[];
}

class LoadedCategoriesState extends DashboardState{
  final Categories categories;
  LoadedCategoriesState({required this.categories});
  @override
  List<Object> get props=>[categories];
}


class ErrorDashboardState extends DashboardState{
  final Object error;
  ErrorDashboardState({required this.error});
  @override
  List<Object> get props=>[error];
}