import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/student_entity.dart';
import '../../domain/usecases/student_usecase.dart';

part 'create_edit_controller.g.dart';

class CreateEditController extends _CreateEditControllerBase with _$CreateEditController {
  final StudentUseCase _studentUseCase;

  CreateEditController(this._studentUseCase) {
    super.studentUseCase = _studentUseCase;
  }
}

abstract class _CreateEditControllerBase with Store {
  late StudentUseCase studentUseCase;

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final academicRecordController = TextEditingController();

  @observable
  bool loading = false;

  @observable
  bool errorVisibility = false;

  @action
  mountScreenControllers(StudentEntity entity) {
    nameController.text = entity.name!;
    dateController.text = entity.birthdate.split('-').reversed.join('/');
    cpfController.text = entity.cpf!;
    emailController.text = entity.email!;
    academicRecordController.text = entity.academicRecord!;
  }

  @action
  registerStudent(BuildContext context) async {
    loading = true;

    final result = await studentUseCase.register(
        entity: StudentEntity(
      academicRecord: academicRecordController.text,
      birthdate: dateController.text.split('/').reversed.join('-'),
      cpf: cpfController.text,
      email: emailController.text,
      name: nameController.text,
    ));

    result.fold((error) {
      showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}', null);
    }, (success) async {
      Modular.to.pop();
      showDialogInPage(context, 'Aluno adicionado com sucesso!', 'Aluno adicionado');
    });

    loading = false;
  }

  @action
  editStudent(BuildContext context, String id) async {
    loading = true;

    final result = await studentUseCase.editStudent(
        id: id,
        entity: StudentEntity(
          academicRecord: academicRecordController.text,
          birthdate: dateController.text.split('/').reversed.join('-'),
          cpf: cpfController.text,
          email: emailController.text,
          name: nameController.text,
        ));

    result.fold((error) {
      showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}', null);
    }, (success) async {
      Modular.to.pop();
      showDialogInPage(context, 'Aluno editado com sucesso!', 'Aluno editado');
    });

    loading = false;
  }

  @action
  showDialogInPage(BuildContext context, String message, String? title) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SizedBox(
            width: 250,
            child: AlertDialog(
              title: Text(title ?? ''),
              content: Text(
                message,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    Modular.to.pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color(0xff2f617e)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
