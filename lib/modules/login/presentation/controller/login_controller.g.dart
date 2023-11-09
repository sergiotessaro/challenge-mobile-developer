// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_LoginControllerBase.loading', context: context);

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

  late final _$obscurePasswordAtom =
      Atom(name: '_LoginControllerBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$getAccountLocallyAndLoginAutomaticallyAsyncAction = AsyncAction(
      '_LoginControllerBase.getAccountLocallyAndLoginAutomatically',
      context: context);

  @override
  Future getAccountLocallyAndLoginAutomatically(BuildContext context) {
    return _$getAccountLocallyAndLoginAutomaticallyAsyncAction
        .run(() => super.getAccountLocallyAndLoginAutomatically(context));
  }

  late final _$registerActionAsyncAction =
      AsyncAction('_LoginControllerBase.registerAction', context: context);

  @override
  Future registerAction(BuildContext context) {
    return _$registerActionAsyncAction.run(() => super.registerAction(context));
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  dynamic showDialogInPage(BuildContext context, String message) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.showDialogInPage');
    try {
      return super.showDialogInPage(context, message);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
obscurePassword: ${obscurePassword}
    ''';
  }
}
