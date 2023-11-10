import 'package:flutter/material.dart';

import '../arguments/create_and_edit_arguments.dart';

class CreateAndEditPage extends StatefulWidget {
  final CreateAndEditArguments args;

  const CreateAndEditPage({super.key, required this.args});

  @override
  State<CreateAndEditPage> createState() => _CreateAndEditPageState();
}

class _CreateAndEditPageState extends State<CreateAndEditPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
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
                ],
              )),
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
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    !widget.args.edit ? 'Adicionar' : 'Salvar edições',
                    style: const TextStyle(color: Color(0xff2f617e)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
