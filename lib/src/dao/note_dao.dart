import 'package:sqflite_dao_repositorios_models/src/dao/dao.dart';
import 'package:sqflite_dao_repositorios_models/src/model/note_model.dart';

class NoteDao implements Dao<Note> {
  final tableName = 'notes';
  final columnId = 'id';
  final _columnTitle = 'title';
  final _columnDescription = 'description';

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,"
      " $_columnTitle TEXT,"
      " $_columnDescription TEXT)";

  @override
  Note fromMap(Map<String, dynamic> query) {
    Note note = Note();
    note.id = query[columnId];
    note.title = query[_columnTitle];
    note.description = query[_columnDescription];
    return note;
  }

  @override
  Map<String, dynamic> toMap(Note object) {
    return <String, dynamic>{
      _columnTitle: object.title,
      _columnDescription: object.description
    };
  }

  @override
  List<Note> fromList(List<Map<String, dynamic>> query) {
    List<Note> notes = List<Note>();
    for (Map map in query) {
      notes.add(fromMap(map));
    }
    return notes;
  }
}
