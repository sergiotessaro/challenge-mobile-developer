import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

class AccountModel {
  final String? createdAt;
  final String? email;
  final String? token;
  final String? password;
  final String? id;

  AccountModel({
    this.createdAt,
    this.email,
    this.token,
    this.password,
    this.id,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        createdAt: json["createdAt"],
        email: json["email"],
        token: json["token"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "email": email,
        "token": token,
        "password": password,
        "id": id,
      };

  AccountEntity toEntity() {
    return AccountEntity(
      createdAt: createdAt,
      email: email,
      id: id,
      password: password,
      token: token,
    );
  }
}
