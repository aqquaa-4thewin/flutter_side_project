import 'package:flutter/material.dart';
import 'package:flutter_side_project/DB/note.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/pages/add-note.dart';
import 'package:flutter_side_project/pages/note.dart';
import 'package:flutter_side_project/shared/shared.dart';
import 'package:flutter_side_project/widgets/custom-appbar.dart';
import 'package:flutter_side_project/widgets/custom-button.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;
import 'package:flutter_side_project/controllers/note-controller.dart'
    as noteController;

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  NoteDatabase noteDatabase = NoteDatabase.instance;
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController.getAllNotesFromDB();
    // demoNotes.insert(
    //     0,
    //     Note(
    //       ID: 0,
    //       title: "All",
    //       description: u,
    //     ));
    noteStreamController.sink.add("event");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: noteStreamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: theme.primaryColor,
            appBar: const CustomAppbar(title: "Notes"),
            body: Stack(children: [
              Center(
                child: filterdnoteList.isEmpty
                    ? const Center(child: Text('No tasks found'))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return NoteCard(filterdnoteList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 1,
                          );
                        },
                        itemCount: filterdnoteList.length,
                      ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: CustomButton(
                  iconSymbol: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AddNotePage(),
                      ),
                    );
                  },
                ),
              )
            ]),
          );
        });
  }

  Widget NoteCard(Note note) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => NotePage(note: note),
          ),
        );
      },
      child: Card.filled(
        margin: const EdgeInsets.all(30),
        color: note.color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                note.description,
                style: const TextStyle(fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
