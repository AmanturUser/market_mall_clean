import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../domain/repository/repository.dart';
import '../data_sourse/auth_server.dart';


@Injectable(as: AuthRepository)

class AuthRepositoryImpl implements AuthRepository{
  final AuthSourse authSourse;
  AuthRepositoryImpl({required this.authSourse});

  @override
  Future<Either<Failure, bool>> signIn(UserAuth userAuth) async {
    return await _signIn(userAuth);
  }

  Future<Either<Failure, bool>> _signIn(UserAuth userAuth) async {
    try {
      final truth = await authSourse.signIn(userAuth);
      return Right(truth);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(UserAuth userAuth) async {
    return await _signUp(userAuth);
  }


  Future<Either<Failure, bool>> _signUp(UserAuth userAuth) async{
    try {
      final truth = await authSourse.signUp(userAuth);
      return Right(truth);
    } on Failure catch (e) {
      throw Left(ServerError(error: e));
    }
  }
}