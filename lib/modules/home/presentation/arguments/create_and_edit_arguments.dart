import 'package:equatable/equatable.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';

class CreateAndEditArguments extends Equatable {
  final bool edit;
  final String title;
  final StudentEntity? entity;

  const CreateAndEditArguments({required this.edit, required this.title, this.entity});

  @override
  List<Object?> get props => [
        edit,
        title,
        entity,
      ];
}
