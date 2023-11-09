import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/app/error/failure.dart';
import 'package:student_listing/modules/home/data/datasources/student_datasource.dart';
import 'package:student_listing/modules/home/data/model/student_model.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';
import 'package:student_listing/modules/home/domain/mapper/student_model_mapper.dart';
import 'package:student_listing/modules/home/domain/repositories/student_repository.dart';

class StudentRepository implements IStudentRepository {
  final StudentDatasource _studentDatasource;

  StudentRepository(this._studentDatasource);

  @override
  Future<Either<Failure, StudentEntity>> register({required StudentModel studentModel}) async {
    try {
      final response = await _studentDatasource.register();
      return Right(response.toEntity());
    } on TimeoutException {
      return Left(Failure.timeout());
    } catch (e) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getStudents() async {
    try {
      final response = await _studentDatasource.getStudents();
      return Right(response.toEntityList());
    } on TimeoutException {
      return Left(Failure.timeout());
    } catch (e) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudentById({required String id}) async {
    try {
      final response = await _studentDatasource.getStudentById(id: id);
      return Right(response.toEntity());
    } on TimeoutException {
      return Left(Failure.timeout());
    } catch (e) {
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStudent({required String id}) async {
    try {
      final response = await _studentDatasource.deleteStudent(id: id);
      return Right(response);
    } on TimeoutException {
      return Left(Failure.timeout());
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}
