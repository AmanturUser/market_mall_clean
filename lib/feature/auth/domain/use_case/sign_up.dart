import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_journal/error_journal.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/user_auth.dart';
import '../repository/repository.dart';

@injectable
class SignUp implements UseCase<bool, UserAuth> {
  final AuthRepository authRepository;
  SignUp({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(UserAuth userAuth) async {
    return await authRepository.signUp(userAuth);
  }
}
