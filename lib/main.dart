import 'package:flutter/material.dart';
import 'pages/notes_page.dart'; // import your page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      home: NotesPage(),
    );
  }
}
