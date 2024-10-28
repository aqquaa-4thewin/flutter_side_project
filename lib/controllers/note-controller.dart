import 'package:flutter/material.dart';
import 'package:flutter_side_project/DB/note.dart';
import 'package:flutter_side_project/shared/shared.dart';

void UpdateNote(oldnote, newnote) {
  int noteindex = demoNotes.indexOf(oldnote);
  demoNotes.removeAt(noteindex);
  demoNotes.insert(noteindex, newnote);
  noteStreamController.sink.add("update");
}

void deleteNote(note) {
  demoNotes.remove(note);
  noteStreamController.sink.add("delete");
}

void search(value) {
  filterdnoteList = demoNotes
      .where((element) => element.title
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase()))
      .toList();

  if (filterdnoteList.isEmpty && !showSnakBar) {
    showSnakBar = true;
    ScaffoldFeatureController scaffoldFeatureController =
        ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      const SnackBar(
        content: Text('There is no data found'),
      ),
    );

    scaffoldFeatureController.closed.then((onValue) {
      showSnakBar = false;
    });
  }
  noteStreamController.sink.add("update Task");
}

getAllNotesFromDB() async {
  NoteDatabase userDatabase = NoteDatabase.instance;
  await userDatabase.getAllNotes().then((onValue) {
    demoNotes = onValue;
  });
}
