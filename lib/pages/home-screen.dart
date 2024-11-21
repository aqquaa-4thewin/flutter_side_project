import 'package:flutter/material.dart';
import 'package:flutter_side_project/DB/note.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/pages/add-note.dart';
import 'package:flutter_side_project/pages/note.dart';
import 'package:flutter_side_project/shared/shared.dart';
import 'package:flutter_side_project/widgets/custom-appbar.dart';
import 'package:flutter_side_project/widgets/custom-button.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  NoteDatabase noteDatabase = NoteDatabase.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("notes are $demoNotes");
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
                    ? Center(
                        child: Text(
                        'No Notes found',
                        style: TextStyle(
                            color: theme.secondaryColor, fontSize: 30),
                      ))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return NoteCard(filterdnoteList[index],
                              index % theme.noteColors.length);
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
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AddNotePage(),
                      ),
                    )
                        .then(
                      (value) {
                        noteStreamController.sink.add("add");
                      },
                    );
                  },
                ),
              )
            ]),
          );
        });
  }

  Widget NoteCard(Note note, index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                NotePage(note: note, index: index),
          ),
        );
      },
      child: Card.filled(
        margin: const EdgeInsets.all(30),
        color: theme.noteColors[index],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                note.title,
                textAlign: TextAlign.center,
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
