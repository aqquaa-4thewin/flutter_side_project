import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_side_project/DB/note.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/pages/home-empty.dart';
import 'package:flutter_side_project/pages/home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {
      checkNote();
    });
  }

  checkNote() async {
    final NoteDatabase noteDatabase = NoteDatabase.instance;
    final List<Note> notes = await noteDatabase.getAllNotes();

    if (notes.isNotEmpty) {
      // If notes exist, navigate to HomeScreenPage
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreenPage(),
        ),
      );
    } else {
      // If no notes exist, navigate to HomePageEmpty
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePageEmpty(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
