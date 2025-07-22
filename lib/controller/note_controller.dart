import 'package:flutter/material.dart';
import 'package:noteapp/models/note.dart';

class NoteController with ChangeNotifier {
  List<Note> notes = [];

  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    notifyListeners();
  }

  void updateNote(Note note, int index) {
    notes[index].title = note.title;
    notes[index].subscription = note.subscription;
    notifyListeners();
  }
}
