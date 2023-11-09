import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
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
  AccountEntity entity = AccountEntity();

  @observable
  bool loading = false;

  @observable
  bool obscurePassword = false;

  @action
  loginAction() async {
    loading = true;

    final response = await loginUseCase.login(email: emailController.text, password: passwordController.text);

    response.fold((error) {}, (success) {
      print(success);
      entity = success;
    });

    loading = false;
  }
}
