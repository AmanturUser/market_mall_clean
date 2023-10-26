import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/entities/dashboard_entity.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';
import '../data_sourse/dashboard_server.dart';

@Injectable(as: DashboardRepository)

class DashboardRepositoryImpl implements DashboardRepository{
  final DashboardSourse dashboardSourse;
  DashboardRepositoryImpl({required this.dashboardSourse});

  @override
  Future<Either<Failure, Categories>> getCategories() async{
    return await _getCategories();
  }

  Future<Either<Failure,Categories>> _getCategories()async{
    try{
      final categories = await dashboardSourse.getCategories();
      return Right(categories);
    }on Failure catch(e){
      throw Left(ServerError(error: e));
    }
  }


}