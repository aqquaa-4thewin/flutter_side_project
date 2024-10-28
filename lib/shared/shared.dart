import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_side_project/models/note.dart';

var noteStreamController = StreamController.broadcast();
bool showSnakBar = false;
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
List<Note> demoNotes = [];

// List<Note> demoNotes = [
//   Note(
//       ID: DateTime.now().millisecondsSinceEpoch,
//       title: "study",
//       description:
//           " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
//   Note(ID: 1, title: "study", description: " a note to study"),
//   Note(ID: 2, title: "study", description: " a note to study"),
//   Note(ID: 3, title: "study", description: " a note to study"),
//   Note(ID: 4, title: "study", description: " a note to study"),
//   Note(ID: 5, title: "study", description: " a note to study"),
//   Note(ID: 6, title: "new note", description: " a note to study"),
// ];
List<Note> filterdnoteList = demoNotes;
const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
const textType = 'TEXT NOT NULL';
const integerType = 'INTEGER NOT NULL';
