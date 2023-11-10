import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  final dynamic Function() addStudents;
  final dynamic Function() logout;

  DrawerMenuWidget({required this.addStudents, required this.logout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff2f617e)),
            child: Text(
              'Alunos',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Adicionar alunos'),
            onTap: addStudents,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
