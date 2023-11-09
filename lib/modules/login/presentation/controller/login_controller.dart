import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController extends _LoginControllerBase with _$LoginController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase) {
    super.loginUseCase = loginUseCase;
  }
}

abstract class _LoginControllerBase with Store {
  late LoginUseCase loginUseCase;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  bool loading = false;

  @observable
  bool obscurePassword = false;

  @action
  getAccountLocallyAndLoginAutomatically(BuildContext context) async {
    loading = true;
    final sharedPreferences = await SharedPreferences.getInstance();
    
    Map<String, dynamic>? account;

    if (sharedPreferences.containsKey('account')) {
      account = jsonDecode(sharedPreferences.getString('account')!);
    }

    final response = await loginUseCase.getAccountById(id: account!['id']);

    response.fold((l) {
      showDialogInPage(context, 'Erro no login');
    }, (entity) {
      Modular.to.pushNamed('home_page', arguments: entity);
    });

    loading = false;
  }

  @action
  registerAction(BuildContext context) async {
    loading = true;
    final sharedPreferences = await SharedPreferences.getInstance();

    final response = await loginUseCase.register(email: emailController.text, password: passwordController.text);

    response.fold((error) {
      showDialogInPage(context, 'Erro no login');
    }, (entity) {
      sharedPreferences.setString(
          'account',
          jsonEncode({
            "createdAt": "${entity.createdAt}",
            "email": "${entity.email}",
            "token": "${entity.token}",
            "password": "${entity.password}",
            "id": "${entity.id}",
          }));

      Modular.to.pushNamed('home_page', arguments: entity);
    });

    loading = false;
  }

  @action
  showDialogInPage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
