import 'package:dartz/dartz.dart';
import 'package:student_listing/modules/home/data/repositories/student_repository.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';

import '../../../app/error/error.dart';

abstract class IStudentUseCase {
  Future<Either<Failure, StudentEntity>> register({required StudentEntity entity});
  Future<Either<Failure, List<StudentEntity>>> getStudents();
  Future<Either<Failure, StudentEntity>> getStudentById({required String id});
}

class StudentUseCase implements IStudentUseCase {
  final StudentRepository studentRepository;

  StudentUseCase(this.studentRepository);

  @override
  Future<Either<Failure, StudentEntity>> register({required StudentEntity entity}) async {
    return await studentRepository.register(studentModel: entity.toModel());
  }

  @override
  Future<Either<Failure, List<StudentEntity>>> getStudents() async {
    return await studentRepository.getStudents();
  }

  @override
  Future<Either<Failure, StudentEntity>> getStudentById({required String id}) async {
    return await studentRepository.getStudentById(id: id);
  }
}
