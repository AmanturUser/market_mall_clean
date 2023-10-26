import 'package:dartz/dartz.dart';
import 'package:market_mall_flutter_bloc/feature/dashboard_feature/domain/entities/dashboard_entity.dart';

import '../../../../core/error_journal/error_journal.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, Categories>> getCategories();
}
