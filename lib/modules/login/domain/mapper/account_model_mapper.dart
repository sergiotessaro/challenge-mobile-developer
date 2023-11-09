import 'package:student_listing/modules/login/data/model/account_model.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

extension ListAccountModelMapper on List<AccountModel> {
  List<AccountEntity> toEntityList() => map((e) => e.toEntity()).toList();
}

extension AccountModelMapper on AccountModel {
  AccountEntity toEntity() => AccountEntity(
        createdAt: createdAt,
        email: email,
        id: id,
        password: password,
        token: token,
      );
}
