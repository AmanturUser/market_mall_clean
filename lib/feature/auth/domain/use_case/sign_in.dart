import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mall_flutter_bloc/feature/auth/domain/entities/user_auth.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../repository/repository.dart';

@injectable
class SignIn implements UseCase<bool, UserAuth> {
  final AuthRepository authRepository;
  SignIn({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(UserAuth userAuth) async {
    return await authRepository.signIn(userAuth);
  }
}
