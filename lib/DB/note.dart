import 'package:flutter_side_project/models/note.dart';
import 'package:flutter_side_project/shared/shared.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteFields {
  static final List<String> values = [
    ID,
    title,
    description,
    color,
  ];

  static const String title = 'title';
  static const String ID = 'ID';
  static const String description = 'description';
  static const String color = 'color';
}

const tableNotes = 'notes';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();

  static Database? _database;

  NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('note.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.ID} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.color} $textType,
  )
''');
  }

  Future<int> create(Note note) async {
    final db = await instance.database;

    await db.rawInsert(
        'INSERT INTO $tableNotes(${NoteFields.title}, ${NoteFields.ID}) VALUES(?, ?)',
        [NoteFields.color, NoteFields.description]);

    final result = db.insert(tableNotes, note.toMap());

    return result;
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toMap(),
      where: '${NoteFields.ID} = ?',
      whereArgs: [note.ID],
    );
  }

  Future<List<Note>> getAllNotes() async {
    final db = await instance.database;

    final results = await db.query(tableNotes);
    print(results);
    return results.map((json) => Note.fromMap(json)).toList();
  }
}
