import 'package:student_listing/modules/login/domain/entities/account_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../app/error/failure.dart';

abstract class ILoginRepository {
  Future<Either<Failure, AccountEntity>> login({required String email, required String password});
}
