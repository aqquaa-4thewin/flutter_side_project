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
  ${NoteFields.color} $textType
)
''');
  }

  Future<int> create(Map<String, Object> note) async {
    final db = await instance.database;
    int k = await db.insert(tableNotes, note);
    return k;
  }

  Future<int> update(Map<String, Object> note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note,
      where: '${NoteFields.ID} = ?',
      whereArgs: [note['ID']],
    );
  }

  Future<int> delete(Map<String, Object> note) async {
    final db = await instance.database;

    return db.delete(
      tableNotes,
      where: '${NoteFields.ID} = ?',
      whereArgs: [note['ID']],
    );
  }

  Future getAllNotes() async {
    final db = await instance.database;

    final results = await db.query(tableNotes);
    return results;
  }
}
