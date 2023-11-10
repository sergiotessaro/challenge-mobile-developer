import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/home/presentation/arguments/create_and_edit_arguments.dart';
import 'package:student_listing/modules/home/presentation/widget/drawer_menu_widget.dart';
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
  final key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller.getStudentsAndCreateList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        key: key,
        appBar: AppBar(
          title: const Text('Alunos'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff2f617e),
        ),
        drawer: DrawerMenuWidget(
          addStudents: () => Modular.to.pushNamed(
            'create_edit_page',
            arguments: const CreateAndEditArguments(edit: false, title: 'Adicionar aluno'),
          ),
          logout: () => controller.deleteAccountAndLogout(context),
        ),
        body: !controller.loading
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                    child: TextField(
                      controller: controller.sortController,
                      onChanged: (value) {
                        controller.getSortedList(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Buscar...',
                          prefixIcon: const Icon(Icons.search, color: Color(0xff2f617e)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(color: Color(0xff2f617e)),
                          ),
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
                  Expanded(
                    child: ListView.builder(
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
                                          onPressed: () {
                                            Modular.to.pushNamed('create_edit_page', arguments: CreateAndEditArguments(edit: true, title: 'Editar aluno', entity: controller.studentList[index]));
                                          },
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
                                          style: const TextStyle(fontSize: 14, height: 1.5),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              controller.showConfirmationDialog(context, controller.studentList[index].id);
                                            },
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
                        }),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff2f617e),
                ),
              ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color(0xff2f617e),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            label: const Row(
              children: [
                Icon(Icons.add),
                SizedBox(
                  width: 8,
                ),
                Text('Adicionar Aluno')
              ],
            ),
            onPressed: () {
              Modular.to.pushNamed('create_edit_page', arguments: const CreateAndEditArguments(edit: false, title: 'Adicionar aluno'));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            useLegacyColorScheme: false,
            currentIndex: controller.currentIndex,
            onTap: (index) {
              controller.currentIndex = index;

              if (index == 0) {
                _showdrawer();
              }
            },
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            selectedLabelStyle: const TextStyle(color: Colors.black),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Ajuda'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined), label: 'Notificações'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Perfil'),
            ]),
      );
    });
  }

  _showdrawer() {
    key.currentState!.openDrawer();
  }
}
