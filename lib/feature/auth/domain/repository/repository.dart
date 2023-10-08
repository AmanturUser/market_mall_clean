import 'package:dartz/dartz.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';

import '../../../../core/error_journal/error_journal.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> signIn(UserAuth userAuth);

  Future<Either<Failure, bool>> signUp(UserAuth userAuth);
}
