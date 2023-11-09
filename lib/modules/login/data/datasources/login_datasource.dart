import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/account_model.dart';

abstract class ILoginDatasource {
  Future<AccountModel> login({required String email, required String password});
  Future<List<AccountModel>> getAccounts();
}

class LoginDatasource implements ILoginDatasource {
  final Dio dio;

  LoginDatasource({required this.dio});

  @override
  Future<AccountModel> login({required String email, required String password}) async {
    final response = await dio.post(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return AccountModel.fromJson(response.data);
  }

  @override
  Future<List<AccountModel>> getAccounts() async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login',
    );

    return jsonDecode(response.data).map<AccountModel>((account) => AccountModel.fromJson(account)).toList();
  }
}
