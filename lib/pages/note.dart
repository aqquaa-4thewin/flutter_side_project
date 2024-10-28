import 'package:flutter/material.dart';
import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/theme/colors.dart' as theme;
import 'package:flutter_side_project/controllers/note-controller.dart'
    as noteController;

// ignore: must_be_immutable
class NotePage extends StatefulWidget {
  final Note note;
  bool isEditPage;
  NotePage({super.key, required this.note, this.isEditPage = false});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late Note note;
  late bool isEditPage;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  String title = '';
  String desc = '';
  @override
  void initState() {
    super.initState();
    note = widget.note; // Initialize the note from the widget
    title = widget.note.title;

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
              ? IconButton(
                  onPressed: () {
                    Note newNote = Note(
                        ID: DateTime.now().millisecondsSinceEpoch,
                        title: title,
                        description: desc,
                        color: note.color);
                    if (title.isNotEmpty) {
                      noteController.UpdateNote(note, newNote);
                    } else {
                      noteController.deleteNote(note);
                    }
                  },
                  icon: const Icon(Icons.save_alt_outlined),
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                )
              : const Spacer(),
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
                color: note.color,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: !isEditPage
                        ? Column(
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
