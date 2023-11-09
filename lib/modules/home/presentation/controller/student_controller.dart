import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';
import 'package:student_listing/modules/home/domain/usecases/student_usecase.dart';

part 'student_controller.g.dart';

class StudentController extends _StudentControllerBase with _$StudentController {
  final StudentUseCase studentUseCase;

  StudentController(this.studentUseCase) {
    super.studentUseCase = studentUseCase;
  }
}

abstract class _StudentControllerBase with Store {
  late StudentUseCase studentUseCase;

  @observable
  bool loading = false;

  @observable
  List<StudentEntity> studentList = [];

  @action
  getStudentsAndCreateList(BuildContext context) async {
    loading = true;

    final result = await studentUseCase.getStudents();

    result.fold((error) {
      showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n$error');
    }, (entityList) {
      studentList = entityList;
    });

    loading = false;
  }

  @action
  showDialogInPage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            width: 250,
            child: AlertDialog(
              content: Text(
                message,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Modular.to.pop(),
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
