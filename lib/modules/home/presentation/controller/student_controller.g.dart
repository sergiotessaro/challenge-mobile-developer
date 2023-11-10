// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentController on _StudentControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_StudentControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_StudentControllerBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$studentListAtom =
      Atom(name: '_StudentControllerBase.studentList', context: context);

  @override
  List<StudentEntity> get studentList {
    _$studentListAtom.reportRead();
    return super.studentList;
  }

  @override
  set studentList(List<StudentEntity> value) {
    _$studentListAtom.reportWrite(value, super.studentList, () {
      super.studentList = value;
    });
  }

  late final _$getStudentsAndCreateListAsyncAction = AsyncAction(
      '_StudentControllerBase.getStudentsAndCreateList',
      context: context);

  @override
  Future getStudentsAndCreateList(BuildContext context) {
    return _$getStudentsAndCreateListAsyncAction
        .run(() => super.getStudentsAndCreateList(context));
  }

  late final _$_deleteStudentActionAsyncAction = AsyncAction(
      '_StudentControllerBase._deleteStudentAction',
      context: context);

  @override
  Future _deleteStudentAction(BuildContext context, String id) {
    return _$_deleteStudentActionAsyncAction
        .run(() => super._deleteStudentAction(context, id));
  }

  late final _$_StudentControllerBaseActionController =
      ActionController(name: '_StudentControllerBase', context: context);

  @override
  dynamic showConfirmationDialog(BuildContext context, String id) {
    final _$actionInfo = _$_StudentControllerBaseActionController.startAction(
        name: '_StudentControllerBase.showConfirmationDialog');
    try {
      return super.showConfirmationDialog(context, id);
    } finally {
      _$_StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showErrorDialogInPage(BuildContext context, String message) {
    final _$actionInfo = _$_StudentControllerBaseActionController.startAction(
        name: '_StudentControllerBase.showErrorDialogInPage');
    try {
      return super.showErrorDialogInPage(context, message);
    } finally {
      _$_StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
currentIndex: ${currentIndex},
studentList: ${studentList}
    ''';
  }
}
