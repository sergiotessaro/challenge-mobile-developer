import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/app/error/failure.dart';
import 'package:student_listing/modules/login/data/datasources/login_datasource.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';
import 'package:student_listing/modules/login/domain/repositories/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepository(this._loginDatasource);

  @override
  Future<Either<Failure, AccountEntity>> login({required String email, required String password}) async {
    try {
      final response = await _loginDatasource.login(email: email, password: password);
      return Right(response.toEntity());
    } on TimeoutException {
      return Left(Failure.timeout());
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}
