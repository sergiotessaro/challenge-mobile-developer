import 'package:flutter/material.dart';
import 'package:student_listing/modules/login/domain/entities/account_entity.dart';

class HomePage extends StatefulWidget {
  final AccountEntity accountEntity;

  const HomePage({super.key, required this.accountEntity});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff2f617e),
      ),
      body: Container(
        child: Column(
          children: [Text(widget.accountEntity.email!)],
        ),
      ),
    );
  }
}
