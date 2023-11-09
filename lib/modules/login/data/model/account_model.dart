import 'dart:core';

import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String? createdAt;
  final String? email;
  final String? token;
  final String? password;
  final String? id;

  const AccountModel({
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

  static List<AccountModel> fromListJson(List maps) => maps.map((e) => AccountModel.fromJson(e)).toList();

  @override
  List<Object?> get props => [
        createdAt,
        email,
        id,
        password,
        token,
      ];
}
