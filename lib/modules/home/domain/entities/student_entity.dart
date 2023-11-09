import 'package:equatable/equatable.dart';
import 'package:student_listing/modules/home/data/model/student_model.dart';

class StudentEntity extends Equatable {
  final String? createdAt;
  final String? name;
  final String? birthdate;
  final String? cpf;
  final String? email;
  final String? academicRecord;
  final String? id;

  const StudentEntity({
    this.createdAt,
    this.email,
    this.name,
    this.birthdate,
    this.id,
    this.academicRecord,
    this.cpf,
  });

  StudentModel toModel() {
    return StudentModel(
      createdAt: createdAt!,
      email: email!,
      id: id!,
      name: name!,
      birthdate: birthdate!,
      academicRecord: academicRecord!,
      cpf: cpf!,
    );
  }

  @override
  List<Object?> get props => [
        createdAt,
        name,
        birthdate,
        cpf,
        email,
        academicRecord,
        id,
      ];
}
