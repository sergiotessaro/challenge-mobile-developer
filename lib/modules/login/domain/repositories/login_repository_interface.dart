import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

import '../../../app/error/failure.dart';

abstract class ILoginRepository {
  Future<Either<Failure, AccountEntity>> login({required String email, required String password});
  Future<Either<Failure, List<AccountEntity>>> getAccounts();
  Future<Either<Failure, AccountEntity>> getAccountById({required String id});
  Future<Either<Failure, bool>> deleteAccount({required String id});
}
