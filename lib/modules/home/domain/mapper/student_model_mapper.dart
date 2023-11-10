import 'package:student_listing/modules/home/data/model/student_model.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';

extension ListStudentModelMapper on List<StudentModel> {
  List<StudentEntity> toEntityList() => map((e) => e.toEntity()).toList();
}

extension AccountModelMapper on StudentModel {
  StudentEntity toEntity() => StudentEntity(
        createdAt: createdAt,
        email: email,
        id: id,
        academicRecord: academicRecord,
        birthdate: birthdate,
        cpf: cpf,
        name: name,
      );
}
