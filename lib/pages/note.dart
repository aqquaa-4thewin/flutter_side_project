import 'package:flutter/material.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;
import 'package:flutter_side_project/controllers/note-controller.dart'
    as noteController;
import 'package:flutter_side_project/widgets/custom-button.dart';

// ignore: must_be_immutable
class NotePage extends StatefulWidget {
  final Note note;
  bool isEditPage;
  int index;
  NotePage(
      {super.key, required this.note, this.isEditPage = false, this.index = 0});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late Note note;
  late bool isEditPage;
  late int index;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  String title = '';
  String desc = '';
  @override
  void initState() {
    super.initState();
    note = widget.note; // Initialize the note from the widget
    title = widget.note.title;
    desc = note.description;
    index = widget.index;
    isEditPage = widget.isEditPage;
    titleController = TextEditingController(text: note.title);
    descriptionController = TextEditingController(text: note.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: theme.primaryColor,
        iconTheme: IconThemeData(color: theme.secondaryColor),
        actions: [
          isEditPage
              ? CustomButton(
                  iconSymbol: const Icon(Icons.save_alt_outlined),
                  onPressed: () {
                    setState(() {});
                    Note newNote = Note(
                        ID: note.ID,
                        title: title,
                        description: desc,
                        color: theme.noteColors[index]);
                    if (title.isNotEmpty) {
                      noteController.updateNote(note, newNote);
                    } else {
                      noteController.deleteNote(note);
                    }
                  },
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0))
              : CustomButton(
                  iconSymbol: Icon(
                    Icons.delete_forever,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  onPressed: () {
                    setState(() {});
                    AlertDialog(
                      actions: [
                        CustomButton(
                            iconSymbol: Icon(Icons.check),
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
                        CustomButton(
                            iconSymbol: Icon(Icons.close),
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0))
                      ],
                    );
                  },
                ),
        ],
      ),
      body: Center(
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card.filled(
                margin: const EdgeInsets.all(30),
                color: theme.noteColors[index],
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: !isEditPage
                        ? Column(
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
                              )
                            ],
                          )
                        : editNote(note)),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              isEditPage = !isEditPage;
            });
          },
        ),
      ),
    );
  }

  Widget editNote(note) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          keyboardType: const TextInputType.numberWithOptions(),
          maxLines: 1,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 4))),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: descriptionController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(width: 4))),
          maxLines: 20,
          style: const TextStyle(fontSize: 15),
          onChanged: (value) {
            desc = value;
          },
        )
      ],
    );
  }
}
