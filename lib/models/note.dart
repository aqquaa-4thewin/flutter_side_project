import 'package:flutter/material.dart';
import 'package:flutter_side_project/theme/colors.dart';

class Note {
  int ID;
  String title;
  String description;
  Color color;
  static int _colorIndex = 0;
  Note(
      {required this.ID,
      required this.title,
      required this.description,
      Color? color})
      : color = color ?? noteColors[_getNextColorIndex()];

  static int _getNextColorIndex() {
    // get a different color each time
    int currentIndex = _colorIndex;
    _colorIndex = (_colorIndex + 1) % noteColors.length; // Rotates the index
    return currentIndex;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      ID: map['ID'] as int, // Ensure ID is an integer
      title: map['title'] as String, // Ensure title is a string
      description:
          map['description'] as String, // Ensure description is a string
      color: Color(int.parse(
          map['color'] as String)), // Convert color string to Color object
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'title': title,
      'email': description,
      'color': color,
    };
  }
}
