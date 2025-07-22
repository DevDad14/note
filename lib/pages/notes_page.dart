import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:noteapp/pages/func_notes.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    final NoteController noteController = context.read<NoteController>();
    return Scaffold(
      appBar: AppBar(title: Text("Note App")),
      body: Consumer<NoteController>(
        builder:
            (context, value, child) => ListView.builder(
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => FuncNotes(
                              note: noteController.notes[index],
                              index: index,
                            ),
                      ),
                    );
                  },
                  title: Text(noteController.notes[index].title),
                  subtitle: Text(noteController.notes[index].subscription),
                  leading: GestureDetector(
                    onTap: () {
                      noteController.deleteNote(index);
                    },
                    child: Icon(Icons.delete),
                  ),
                );
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FuncNotes()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
