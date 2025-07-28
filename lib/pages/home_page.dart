import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:noteapp/pages/login_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NoteController noteController;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    noteController = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NoteController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(controller: usernameController),
                TextField(controller: passwordController),
                TextField(controller: passwordTwoController),
                ElevatedButton(
                  onPressed: () async {
                    if (passwordController.text != passwordTwoController.text) {
                      return;
                    }

                    final bool isSuccess = await noteController.registerUser(
                      usernameController.text,
                      passwordController.text,
                    );

                    if (isSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  child: Text('đăng ký'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
