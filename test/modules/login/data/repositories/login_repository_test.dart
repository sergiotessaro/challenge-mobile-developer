import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:student_listing/modules/app/error/failure.dart';
import 'package:student_listing/modules/login/data/datasources/login_datasource.dart';
import 'package:student_listing/modules/login/data/model/account_model.dart';
import 'package:student_listing/modules/login/data/repositories/login_repository.dart';

class MockLoginDatasource extends Mock implements LoginDatasource {}

void main() {
  late LoginRepository repository;
  late MockLoginDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockLoginDatasource();
    repository = LoginRepository(mockDatasource);
  });

  group(
    'loginRepository tests',
    () {
      final accountModel = AccountModel(createdAt: '2023-11-02T18:54:47.981Z', email: 'teste', password: 'teste123', id: '1', token: 'asdaaudwdajsfn821');

      // final accountEntity = accountModel.toEntity();
      test('should return Right(true) when login is successful', () async {
        // Arrange

        when(() => mockDatasource.login(email: any(named: 'email'), password: any(named: 'password'))).thenAnswer((invocation) async => accountModel);

        // Act
        final result = await repository.login(email: 'teste', password: 'teste123');

        // Assert
        expect(result.isRight(), true);
        verify(() => mockDatasource.login(email: 'teste', password: 'teste123')).called(1);
      });

      test(
        'should return Right(false) when login fails',
        () async {
          when(() => mockDatasource.login(email: any(named: 'email'), password: any(named: 'password'))).thenThrow(TimeoutException('Timeout'));

          final result = await repository.login(email: 'teste', password: 'teste123');

          expect(result.fold(id, id), isA<Failure>());
          verify(() => mockDatasource.login(email: 'teste', password: 'teste123')).called(1);
        },
      );
    },
  );
}
