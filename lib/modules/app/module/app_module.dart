import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/login/data/datasources/login_datasource.dart';
import 'package:student_listing/modules/login/data/repositories/login_repository.dart';
import 'package:student_listing/modules/login/domain/usecases/login_usecase.dart';
import 'package:student_listing/modules/login/presentation/controller/login_controller.dart';
import 'package:student_listing/modules/login/presentation/views/login_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() {
      final dio = Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 5000)));

      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

      return dio;
    });
    //repository
    i.add(LoginRepository.new);
    //datasource
    i.add(LoginDatasource.new);
    //usecases
    i.add(LoginUseCase.new);
    //controller
    i.add(LoginController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
  }
}
