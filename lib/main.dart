import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart'; // import your page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteController(),
      child: MaterialApp(title: 'Note App', home: NotesPage()),
    );
  }
}
