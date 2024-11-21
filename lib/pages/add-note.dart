import 'package:flutter/material.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/pages/home-screen.dart';
import 'package:flutter_side_project/shared/shared.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;
import 'package:flutter_side_project/controllers/note-controller.dart'
    as noteController;
import 'package:flutter_side_project/widgets/custom-button.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final formKey = GlobalKey<FormState>();
  bool raisetitleError = false;
  TextEditingController titleCont = TextEditingController();
  TextEditingController descriptionCont = TextEditingController();
  String title = '';
  String desctiption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        iconTheme: IconThemeData(
          color: theme.secondaryColor,
        ),
        actions: [
          CustomButton(
              iconSymbol: const Icon(Icons.save_alt_outlined),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Note note = Note(
                      ID: DateTime.now().millisecondsSinceEpoch,
                      title: title,
                      description: desctiption);
                  noteController.addNote(note);
                  noteStreamController.sink.add("add");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreenPage()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0))
        ],
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " Enter a title !";
                      } else {
                        return null;
                      }
                    },
                    controller: titleCont,
                    maxLines: 3,
                    cursorHeight: 50,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 60, color: theme.secondaryColor),
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: "Title",
                      hintStyle: TextStyle(fontSize: 70, color: Colors.white24),
                    ),
                    onChanged: (value) {
                      title = value.toString();
                    },
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: descriptionCont,
                    maxLines: 15,
                    cursorColor: Colors.white,
                    style: TextStyle(fontSize: 30, color: theme.secondaryColor),
                    decoration: const InputDecoration.collapsed(
                        hintText: "Type something",
                        hintStyle:
                            TextStyle(fontSize: 30, color: Colors.white24)),
                    onChanged: (value) {
                      desctiption = value.toString();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
