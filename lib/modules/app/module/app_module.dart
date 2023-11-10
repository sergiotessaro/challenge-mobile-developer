import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/home/data/datasources/student_datasource.dart';
import 'package:student_listing/modules/home/data/repositories/student_repository.dart';
import 'package:student_listing/modules/home/domain/usecases/student_usecase.dart';
import 'package:student_listing/modules/home/presentation/views/create_and_edit_page.dart';
import 'package:student_listing/modules/login/data/datasources/login_datasource.dart';
import 'package:student_listing/modules/login/data/repositories/login_repository.dart';
import 'package:student_listing/modules/login/domain/usecases/login_usecase.dart';
import 'package:student_listing/modules/login/presentation/controller/login_controller.dart';
import 'package:student_listing/modules/login/presentation/views/login_page.dart';

import '../../home/presentation/controller/student_controller.dart';
import '../../home/presentation/views/home_page.dart';

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
    i.add(StudentRepository.new);
    //datasource
    i.add(LoginDatasource.new);
    i.add(StudentDatasource.new);
    //usecases
    i.add(LoginUseCase.new);
    i.add(StudentUseCase.new);
    //controller
    i.add(LoginController.new);
    i.add(StudentController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());

    r.child('/home_page', child: (context) => HomePage(accountEntity: r.args.data));

    r.child('/create_edit_page', child: (context) => CreateAndEditPage(args: r.args.data)); 
  }
}
