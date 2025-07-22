import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';

class FuncNotes extends StatefulWidget {
  Note? note;
  int? index;

  FuncNotes({super.key, this.note, this.index});

  @override
  State<FuncNotes> createState() => _FuncNotesState();
}

class _FuncNotesState extends State<FuncNotes> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subscriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.note?.title ?? '';
    _subscriptionController.text = widget.note?.subscription ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = context.read<NoteController>();

    return Scaffold(
      appBar: AppBar(title: Text("New Note")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _subscriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                final noted = Note(
                  title: _titleController.text,
                  subscription: _subscriptionController.text,
                );
                if (widget.index != null) {
                  noteController.updateNote(noted, widget.index ?? 0);
                }
                // noteController.addNote(noted);
                Navigator.pop(context, noted);
              },
              icon: Icon(Icons.save),
              label: Text("Save Note"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
