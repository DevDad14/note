import 'package:flutter/material.dart';
import 'class_notes.dart';

class FuncNotes extends StatefulWidget {
  final Function(Note) onSave;

  const FuncNotes({super.key, required this.onSave});

  @override
  State<FuncNotes> createState() => _FuncNotesState();
}

class _FuncNotesState extends State<FuncNotes> {
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _SubscriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _TitleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _SubscriptionController,
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
                  title: _TitleController.text,
                  subscription: _SubscriptionController.text,
                );
                widget.onSave(noted);
                Navigator.pop(context);
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
