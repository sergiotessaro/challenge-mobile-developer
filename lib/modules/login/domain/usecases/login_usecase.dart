import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/login/data/repositories/login_repository.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

import '../../../app/error/error.dart';

abstract class ILoginUseCase {
  Future<Either<Failure, AccountEntity>> call({required String email, required String password});
}

class LoginUseCase implements ILoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  @override
  Future<Either<Failure, AccountEntity>> call({required String email, required String password}) async {
    return await loginRepository.login(email: email, password: password);
  }
}