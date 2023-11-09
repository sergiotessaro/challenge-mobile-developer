import 'package:dio/dio.dart';

import '../model/account_model.dart';

abstract class ILoginDatasource {
  Future<AccountModel> register({required String email, required String password});
  Future<List<AccountModel>> getAccounts();
  Future<AccountModel> getAccountById({required String id});
  Future<bool> deleteAccount({required String id});
}

class LoginDatasource implements ILoginDatasource {
  final Dio dio;

  LoginDatasource({required this.dio});

  @override
  Future<AccountModel> register({required String email, required String password}) async {
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

    return AccountModel.fromListJson(response.data);
  }

  @override
  Future<AccountModel> getAccountById({required String id}) async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/$id',
    );

    return AccountModel.fromJson(response.data);
  }

  @override
  Future<bool> deleteAccount({required String id}) async {
    final response = await dio.delete(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/$id',
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return true;
    }
    return false;
  }
}
