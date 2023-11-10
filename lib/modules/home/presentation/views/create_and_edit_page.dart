import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/home/presentation/controller/create_edit_controller.dart';

import '../arguments/create_and_edit_arguments.dart';

class CreateAndEditPage extends StatefulWidget {
  final CreateAndEditArguments args;

  const CreateAndEditPage({super.key, required this.args});

  @override
  State<CreateAndEditPage> createState() => _CreateAndEditPageState();
}

class _CreateAndEditPageState extends State<CreateAndEditPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<CreateEditController>();

  @override
  void initState() {
    super.initState();

    if (widget.args.edit) {
      controller.mountScreenControllers(widget.args.entity!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.args.title),
          backgroundColor: const Color(0xff2f617e),
        ),
        body: Observer(builder: ((context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: !controller.loading
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Dados gerais',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: controller.errorVisibility,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Você precisa preencher os campos obrigatórios!',
                                          style: TextStyle(fontSize: 12, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: controller.nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Nome do aluno*',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      errorStyle: const TextStyle(height: 0)),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: controller.dateController,
                                  keyboardType: TextInputType.datetime,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    DataInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'Data de nascimento',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff2f617e),
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff2f617e),
                                        )),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: controller.cpfController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'CPF*',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff2f617e),
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color: Color(0xff2f617e),
                                        )),
                                    errorStyle: const TextStyle(height: 0),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: controller.academicRecordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabled: !widget.args.edit,
                                      hintText: 'Registro acadêmico*',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      errorStyle: const TextStyle(height: 0)),
                                ),
                                const SizedBox(height: 24.0),
                                const Row(
                                  children: [
                                    Text(
                                      'Dados de acesso',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                                      return 'Email em formato inválido';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'E-mail*',
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff2f617e),
                                          )),
                                      errorStyle: const TextStyle(height: 0)),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
                                    backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff2f617e)),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (!widget.args.edit) {
                                        controller.registerStudent(context);
                                      } else {
                                        controller.editStudent(context, widget.args.entity!.id);
                                      }
                                    } else {
                                      controller.errorVisibility = true;
                                    }
                                  },
                                  child: Text(
                                    !widget.args.edit ? 'Adicionar' : 'Salvar edições',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff2f617e),
                    ),
                  ),
          );
        })));
  }
}
