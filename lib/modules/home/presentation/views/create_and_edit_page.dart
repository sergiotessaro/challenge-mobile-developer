import 'package:flutter/material.dart';

class CreateAndEditPage extends StatefulWidget {
  final String title;
  final bool edit;

  const CreateAndEditPage({super.key, required this.title, required this.edit});

  @override
  State<CreateAndEditPage> createState() => _CreateAndEditPageState();
}

class _CreateAndEditPageState extends State<CreateAndEditPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    !widget.edit ? 'Adicionar' : 'Salvar edições',
                    style: TextStyle(color: Color(0xff2f617e)),
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
