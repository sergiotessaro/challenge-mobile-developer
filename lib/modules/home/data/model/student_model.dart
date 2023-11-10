import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final String createdAt;
  final String name;
  final String birthdate;
  final String cpf;
  final String email;
  final String academicRecord;
  final String id;

  const StudentModel({
    required this.createdAt,
    required this.name,
    required this.birthdate,
    required this.cpf,
    required this.email,
    required this.academicRecord,
    required this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        createdAt: json["createdAt"],
        name: json["name"],
        birthdate: json["birthdate"].toString(),
        cpf: json["cpf"].toString(),
        email: json["email"],
        academicRecord: json["academic_record"].toString(),
        id: json["id"].toString(),
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
        id,
      ];
}
