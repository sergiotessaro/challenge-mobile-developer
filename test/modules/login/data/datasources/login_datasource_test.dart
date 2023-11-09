import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:student_listing/modules/login/data/datasources/login_datasource.dart';
import 'package:student_listing/modules/login/data/model/account_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late LoginDatasource loginDatasource;
  late DioMock dioMock;
  final requestOptions = RequestOptions(path: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login', connectTimeout: const Duration(milliseconds: 5000));

  setUp(() {
    dioMock = DioMock();
    loginDatasource = LoginDatasource(dio: dioMock);
  });

  group('loginDatasource tests', () {
    const email = 'joao@gmail.com';
    const password = 'senha';

    final jsonMock = {'email': email, 'password': password};
    test('when success return an AccountModel', () async {
      // Arrange

      when(() => dioMock.post(any(), data: jsonMock)).thenAnswer((_) async => Response(
            requestOptions: requestOptions,
            data: jsonDecode(fixture('account.json')),
            statusCode: 200,
          ));

      // Act
      final result = await loginDatasource.login(email: email, password: password);

      // Assert
      expect(result, isA<AccountModel>());
    });
  });
}
