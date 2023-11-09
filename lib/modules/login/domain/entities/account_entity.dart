import 'package:student_listing/modules/login/data/model/account_model.dart';

class AccountEntity {
  final String? createdAt;
  final String? email;
  final String? token;
  final String? password;
  final String? id;

  AccountEntity({
    this.createdAt,
    this.email,
    this.token,
    this.password,
    this.id,
  });

  AccountModel toModel() {
    return AccountModel(
      createdAt: createdAt!,
      email: email!,
      id: id!,
      password: password!,
      token: token!,
    );
  }
}
