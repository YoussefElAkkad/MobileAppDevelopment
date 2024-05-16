import 'package:flutter/material.dart';
import 'new_note.dart';
import 'all_notes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Notes(),
      //home: NewNote(),
      debugShowCheckedModeBanner: false,
    );
  }
}
