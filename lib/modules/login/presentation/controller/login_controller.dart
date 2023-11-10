import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController extends _LoginControllerBase with _$LoginController {
  final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase) {
    super.loginUseCase = _loginUseCase;
  }
}

abstract class _LoginControllerBase with Store {
  late LoginUseCase loginUseCase;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool error = false;

  @observable
  bool loading = false;

  @observable
  bool obscurePassword = false;

  @action
  loginAction(BuildContext context) async {
    loading = true;
    error = false;
    final sharedPreferences = await SharedPreferences.getInstance();

    final response = await loginUseCase.getAccounts();

    response.fold((error) {
      showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}');
    }, (entityList) {
      for (var entity in entityList) {
        if (entity.email == emailController.text && entity.password == passwordController.text) {
          sharedPreferences.setString(
              'account',
              jsonEncode({
                "createdAt": "${entity.createdAt}",
                "email": "${entity.email}",
                "token": "${entity.token}",
                "password": "${entity.password}",
                "id": "${entity.id}",
              }));
          Modular.to.pushReplacementNamed('home_page', arguments: entity);
        } else {
          error = true;
        }
      }
      if (error) {
        showDialogInPage(context, 'Email ou senha incorretos!');
      }
    });

    loading = false;
  }

  @action
  getAccountLocallyAndLoginAutomatically(BuildContext context) async {
    loading = true;
    final sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic>? account;

    if (sharedPreferences.containsKey('account')) {
      account = jsonDecode(sharedPreferences.getString('account')!);

      final response = await loginUseCase.getAccountById(id: account!['id']);

      response.fold((error) {
        showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}');
      }, (entity) {
        Modular.to.pushNamed('home_page', arguments: entity);
      });
    }

    loading = false;
  }

  @action
  registerAction(BuildContext context) async {
    loading = true;
    final sharedPreferences = await SharedPreferences.getInstance();

    final response = await loginUseCase.register(email: emailController.text, password: passwordController.text);

    response.fold((error) {
      showDialogInPage(context, 'Erro no login!\nmensagem de erro:\n${error.message}');
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
