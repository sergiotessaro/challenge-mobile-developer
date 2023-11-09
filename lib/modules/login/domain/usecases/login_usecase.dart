import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/login/data/repositories/login_repository.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

import '../../../app/error/error.dart';

abstract class ILoginUseCase {
  Future<Either<Failure, AccountEntity>> login({required String email, required String password});
  Future<Either<Failure, List<AccountEntity>>> getAccounts();
  Future<Either<Failure, AccountEntity>> getAccountById({required String id});
}

class LoginUseCase implements ILoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  @override
  Future<Either<Failure, AccountEntity>> login({required String email, required String password}) async {
    return await loginRepository.login(email: email, password: password);
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts() async {
    return await loginRepository.getAccounts();
  }

  @override
  Future<Either<Failure, AccountEntity>> getAccountById({required String id}) async {
    return await loginRepository.getAccountById(id: id);
  }
}
