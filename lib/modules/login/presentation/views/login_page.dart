import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:student_listing/modules/login/presentation/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset('assets/icon.png'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Preencha os campos obrigatórios';
                          }
                          if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                            return 'Email em formato inválido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
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
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xff2f617e),
                            )),
                      ),
                      const SizedBox(height: 16),
                      Observer(builder: (context) {
                        return TextFormField(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha os campos obrigatórios';
                            }
                            return null;
                          },
                          obscureText: controller.obscurePassword,
                          decoration: InputDecoration(
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
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Color(0xff2f617e),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  !controller.obscurePassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                                  color: const Color(0xff2f617e),
                                ),
                                onPressed: () {
                                  controller.obscurePassword = !controller.obscurePassword;
                                },
                              )),
                        );
                      }),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              _showDialog();
                            },
                            child: const Text(
                              'Esqueci o usuário',
                              style: TextStyle(
                                color: Color(0xff2f617e),
                              ),
                            ),
                          ),
                          const Text('ou'),
                          TextButton(
                            onPressed: () {
                              _showDialog();
                            },
                            child: const Text(
                              'Esqueci a senha',
                              style: TextStyle(
                                color: Color(0xff2f617e),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
                            backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff2f617e)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: const Text('Entrar'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: const BorderSide(color: Color(0xff2f617e)),
                            )),
                            backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.loginAction();
                            }
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(color: Color(0xff2f617e)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
              'Funcionalidade em\nconstrução',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
