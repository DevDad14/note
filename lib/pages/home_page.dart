import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NoteController noteController;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
                TextField(controller: titleController),
                TextField(controller: descriptionController),
                ElevatedButton(
                  onPressed: () {
                    noteController.addTodo(
                      titleController.text,
                      descriptionController.text,
                    );
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
