import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';

import '../../../app/error/failure.dart';
import '../../data/model/student_model.dart';

abstract class IStudentRepository {
  Future<Either<Failure, StudentEntity>> register({required StudentModel studentModel});
  Future<Either<Failure, List<StudentEntity>>> getStudents();
  Future<Either<Failure, StudentEntity>> getStudentById({required String id});
  Future<Either<Failure, bool>> deleteStudent({required String id});
}
