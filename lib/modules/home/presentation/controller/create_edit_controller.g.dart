// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateEditController on _CreateEditControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CreateEditControllerBase.loading', context: context);

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

  late final _$errorVisibilityAtom =
      Atom(name: '_CreateEditControllerBase.errorVisibility', context: context);

  @override
  bool get errorVisibility {
    _$errorVisibilityAtom.reportRead();
    return super.errorVisibility;
  }

  @override
  set errorVisibility(bool value) {
    _$errorVisibilityAtom.reportWrite(value, super.errorVisibility, () {
      super.errorVisibility = value;
    });
  }

  late final _$registerStudentAsyncAction = AsyncAction(
      '_CreateEditControllerBase.registerStudent',
      context: context);

  @override
  Future registerStudent(BuildContext context) {
    return _$registerStudentAsyncAction
        .run(() => super.registerStudent(context));
  }

  late final _$editStudentAsyncAction =
      AsyncAction('_CreateEditControllerBase.editStudent', context: context);

  @override
  Future editStudent(BuildContext context, String id) {
    return _$editStudentAsyncAction.run(() => super.editStudent(context, id));
  }

  late final _$_CreateEditControllerBaseActionController =
      ActionController(name: '_CreateEditControllerBase', context: context);

  @override
  dynamic mountScreenControllers(StudentEntity entity) {
    final _$actionInfo = _$_CreateEditControllerBaseActionController
        .startAction(name: '_CreateEditControllerBase.mountScreenControllers');
    try {
      return super.mountScreenControllers(entity);
    } finally {
      _$_CreateEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showDialogInPage(
      BuildContext context, String message, String? title) {
    final _$actionInfo = _$_CreateEditControllerBaseActionController
        .startAction(name: '_CreateEditControllerBase.showDialogInPage');
    try {
      return super.showDialogInPage(context, message, title);
    } finally {
      _$_CreateEditControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorVisibility: ${errorVisibility}
    ''';
  }
}
