import 'package:flutter/material.dart';
import 'package:noteapp/controller/note_controller.dart';
import 'package:noteapp/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteController(),
      child: MaterialApp(home: HomePage()),
    );
  }
}
