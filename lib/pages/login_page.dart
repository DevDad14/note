import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:noteapp/pages/success_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    NoteController noteController = context.read();
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: usernameController),
          TextField(controller: passwordController),
          ElevatedButton(
            onPressed: () async {
              final bool isSuccess = await noteController.loginUser(
                usernameController.text,
                passwordController.text,
              );
              if (isSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessPage()),
                );
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
