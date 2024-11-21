import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_side_project/controllers/note-controller.dart';
import 'package:flutter_side_project/pages/home-empty.dart';
import 'package:flutter_side_project/pages/home-screen.dart';
import 'package:flutter_side_project/shared/shared.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    getAllNotesFromDB();
    super.initState();
    Timer(const Duration(seconds: 1), () {
      checkNote();
    });
  }

  checkNote() {
    if (demoNotes.isNotEmpty) {
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
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
