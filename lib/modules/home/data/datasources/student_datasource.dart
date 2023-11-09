import 'package:dio/dio.dart';

import '../model/student_model.dart';

abstract class IStudentDatasource {
  Future<StudentModel> register({StudentModel? studentModel});
  Future<List<StudentModel>> getStudents();
  Future<StudentModel> getStudentById({required String id});
  Future<bool> deleteStudent({required String id});
}

class StudentDatasource implements IStudentDatasource {
  final Dio dio;

  StudentDatasource({required this.dio});

  @override
  Future<StudentModel> register({StudentModel? studentModel}) async {
    final response = await dio.post(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
      data: studentModel!.toJson(),
    );

    return StudentModel.fromJson(response.data);
  }

  @override
  Future<List<StudentModel>> getStudents() async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
    );

    return StudentModel.fromListJson(response.data);
  }

  @override
  Future<StudentModel> getStudentById({required String id}) async {
    final response = await dio.get(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/$id',
    );

    return StudentModel.fromJson(response.data);
  }

  @override
  Future<bool> deleteStudent({required String id}) async {
    final response = await dio.delete(
      'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/$id',
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return true;
    }
    return false;
  }
}
