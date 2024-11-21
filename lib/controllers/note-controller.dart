import 'package:flutter/material.dart';
import 'package:flutter_side_project/DB/note.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/shared/shared.dart';

void updateNote(oldnote, newnote) {
  NoteDatabase noteDatabase = NoteDatabase.instance;
  noteDatabase.update(convertNoteData(newnote));
  getAllNotesFromDB();
  noteStreamController.sink.add("update");
}

void deleteNote(note) {
  NoteDatabase noteDatabase = NoteDatabase.instance;
  noteDatabase.delete(convertNoteData(note));
  getAllNotesFromDB();
  noteStreamController.sink.add("delete");
}

void addNote(note) async {
  NoteDatabase noteDatabase = NoteDatabase.instance;
  noteDatabase.create(convertNoteData(note));
  await getAllNotesFromDB();
  noteStreamController.sink.add("add");
  print(demoNotes);
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
    if (navigatorKey.currentState != null) {
      ScaffoldMessenger.of(navigatorKey.currentState!.context)
          .showSnackBar(
            const SnackBar(
              content: Text('There is no data found'),
            ),
          )
          .closed
          .then((onValue) {
        showSnakBar = false;
      });
    } else {
      // Handle case where context is not available
      debugPrint('Unable to show SnackBar: Context is not available.');
    }
  }
  noteStreamController.sink.add("update Task");
}

Future<void> getAllNotesFromDB() async {
  demoNotes = [];
  await NoteDatabase.instance.getAllNotes().then((onvalue) {
    for (int i = 0; i < onvalue.length; i++) {
      demoNotes.add(Note.fromMap(onvalue[i]));
    }
  });
  print(demoNotes);
  noteStreamController.sink.add("update");
}

Map<String, Object> convertNoteData(Note note) {
  // from an object to map
  Map<String, Object> newNote = {};

  newNote['ID'] = note.ID;
  newNote['title'] = note.title.toString();
  newNote['description'] = note.description.toString();
  newNote['color'] = note.color.value.toString();

  return newNote;
}
