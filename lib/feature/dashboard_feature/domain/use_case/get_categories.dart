import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/entities/dashboard_entity.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class GetCategories implements UseCase<Categories, NoParams>{
  final DashboardRepository dashboardRepository;
  GetCategories({required this.dashboardRepository});

  @override
  Future<Either<Failure, Categories>> call(NoParams params)async{
    return await dashboardRepository.getCategories();
  }
}