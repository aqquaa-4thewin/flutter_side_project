import 'package:flutter/material.dart';
import 'package:flutter_side_project/pages/home-empty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePageEmpty(),
      debugShowCheckedModeBanner: false,
    );
  }
}
