import 'package:flutter/material.dart';
import 'package:flutter_side_project/pages/add-note.dart';
import 'package:flutter_side_project/theme/colors.dart';

class HomePageEmpty extends StatefulWidget {
  const HomePageEmpty({super.key});

  @override
  State<HomePageEmpty> createState() => _HomePageEmptyState();
}

class _HomePageEmptyState extends State<HomePageEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: Color(0xFF252525),
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AddNotePage(),
                  ),
                );
              },
              backgroundColor: Color(0xFF252525),
              foregroundColor: Colors.white,
              mini: true,
              shape: CircleBorder(),
              child: const Icon(
                Icons.search_outlined,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 350,
                height: 286,
                child: Image.asset("assets/Notebook-rafiki.png")),
            const Text(
              "create your first note !",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          elevation: 10,
          backgroundColor: Color(0xFF252525),
          foregroundColor: Colors.white,
          highlightElevation: 33,
          child: Icon(
            Icons.add,
          )),
    );
  }
}
