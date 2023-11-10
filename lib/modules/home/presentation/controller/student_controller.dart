import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_listing/modules/home/domain/entities/student_entity.dart';
import 'package:student_listing/modules/home/domain/usecases/student_usecase.dart';

part 'student_controller.g.dart';

class StudentController extends _StudentControllerBase with _$StudentController {
  final StudentUseCase _studentUseCase;

  StudentController(this._studentUseCase) {
    super.studentUseCase = _studentUseCase;
  }
}

abstract class _StudentControllerBase with Store {
  late StudentUseCase studentUseCase;

  final sortController = TextEditingController();

  @observable
  bool loading = false;

  @observable
  int currentIndex = 0;

  @observable
  List<StudentEntity> studentList = [];

  List<StudentEntity> auxList = [];

  @action
  getStudentsAndCreateList(BuildContext context) async {
    loading = true;

    final result = await studentUseCase.getStudents();

    result.fold((error) {
      showErrorDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}');
    }, (entityList) {
      studentList = entityList;
      auxList = studentList;
    });

    loading = false;
  }

  @action
  _deleteStudentAction(BuildContext context, String id) async {
    loading = true;

    final result = await studentUseCase.deleteStudent(id: id);

    result.fold((error) {
      showErrorDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}');
    }, (success) async {
      if (success) {
        Modular.to.pop();
        await getStudentsAndCreateList(context);
      }
    });

    loading = false;
  }

  getSortedList(String? value) {
    if (value != null && value.isNotEmpty) {
      List<StudentEntity> outputList = studentList.where((o) => o.name!.toUpperCase().contains(value.toUpperCase()) && o.name!.toUpperCase().startsWith(value.toUpperCase())).toList()
        ..sort((a, b) => a.name!.toUpperCase().compareTo(
              b.name!.toUpperCase(),
            ));
      studentList = outputList;
    } else if (value == '' || value == null) {
      studentList = auxList;
    }
  }

  @action
  deleteAccountAndLogout(BuildContext context) async {
    loading = true;

    final sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('account');

    Modular.to.pushNamed('/');

    loading = false;
  }

  @action
  showConfirmationDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            width: 250,
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
              title: const Text('Excluir aluno'),
              content: const Expanded(
                child: Text(
                  'Tem certeza que deseja excluir esse aluno? Todas as informações dele serão apagadas.',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Modular.to.pop(),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Color(0xff2f617e)),
                  ),
                ),
                TextButton(
                  onPressed: () => _deleteStudentAction(context, id),
                  child: const Text(
                    'Excluir Aluno',
                    style: TextStyle(color: Color(0xff2f617e)),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @action
  showErrorDialogInPage(BuildContext context, String message) {
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
