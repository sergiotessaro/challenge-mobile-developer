import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

import '../controller/student_controller.dart';

class HomePage extends StatefulWidget {
  final AccountEntity accountEntity;

  const HomePage({super.key, required this.accountEntity});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<StudentController>();

  @override
  void initState() {
    super.initState();
    controller.getStudentsAndCreateList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alunos'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff2f617e),
        ),
        body: Observer(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: const Icon(Icons.search, color: Color(0xff2f617e)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(color: Color(0xff2f617e)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(color: Color(0xff2f617e)),
                      )),
                ),
              ),
              ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
                  shrinkWrap: true,
                  itemCount: controller.studentList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 2.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.studentList[index].name!,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    splashRadius: 20,
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xff2f617e),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.studentList[index].academicRecord!}\nCPF: ${controller.studentList[index].cpf!}',
                                    style: TextStyle(fontSize: 14, height: 1.5),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      splashRadius: 20,
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Color(0xff2f617e),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          );
        }));
  }
}
