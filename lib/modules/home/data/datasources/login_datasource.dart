import 'package:dio/dio.dart';

import '../model/student_model.dart';

abstract class IStudentDatasource {
  Future<StudentModel> register({required String email, required String password});
  Future<List<StudentModel>> getStudents();
  Future<StudentModel> getStudentById({required String id});
  Future<bool> deleteStudent({required String id});
}

class StudentDatasource implements IStudentDatasource {
  final Dio dio;

  StudentDatasource({required this.dio});

  @override
  Future<StudentModel> register({required String email, required String password}) async {
    final response = await dio.post(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return StudentModel.fromJson(response.data);
  }

  @override
  Future<List<StudentModel>> getStudents() async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login',
    );

    return StudentModel.fromListJson(response.data);
  }

  @override
  Future<StudentModel> getStudentById({required String id}) async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/$id',
    );

    return StudentModel.fromJson(response.data);
  }

  @override
  Future<bool> deleteStudent({required String id}) async {
    final response = await dio.delete(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/$id',
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return true;
    }
    return false;
  }
}
