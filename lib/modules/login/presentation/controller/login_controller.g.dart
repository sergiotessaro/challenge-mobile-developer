// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$entityAtom =
      Atom(name: '_LoginControllerBase.entity', context: context);

  @override
  AccountEntity get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(AccountEntity value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

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

  late final _$loginActionAsyncAction =
      AsyncAction('_LoginControllerBase.loginAction', context: context);

  @override
  Future loginAction() {
    return _$loginActionAsyncAction.run(() => super.loginAction());
  }

  @override
  String toString() {
    return '''
entity: ${entity},
loading: ${loading},
obscurePassword: ${obscurePassword}
    ''';
  }
}
