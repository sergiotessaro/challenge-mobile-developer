import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final String createdAt;
  final String name;
  final int birthdate;
  final int cpf;
  final String email;
  final int academicRecord;
  final int academicRecord2;
  final String id;

  const StudentModel({
    required this.createdAt,
    required this.name,
    required this.birthdate,
    required this.cpf,
    required this.email,
    required this.academicRecord,
    required this.academicRecord2,
    required this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        createdAt: json["createdAt"],
        name: json["name"],
        birthdate: json["birthdate"],
        cpf: json["cpf"],
        email: json["email"],
        academicRecord: json["academic_record"],
        academicRecord2: json["academicRecord"],
        id: json["id"],
      );

  static List<StudentModel> fromListJson(List maps) => maps.map((e) => StudentModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthdate": birthdate,
        "cpf": cpf,
        "email": email,
        "academic_record": academicRecord,
      };

  @override
  List<Object?> get props => [
        createdAt,
        name,
        birthdate,
        cpf,
        email,
        academicRecord,
        academicRecord2,
        id,
      ];
}
