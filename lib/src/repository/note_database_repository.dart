import 'package:sqflite_dao_repositorios_models/src/dao/note_dao.dart';
import 'package:sqflite_dao_repositorios_models/src/model/note_model.dart';
import 'package:sqflite_dao_repositorios_models/src/provider/db_provider.dart';

import 'notes_repository.dart';

class NotesDatabaseRepository implements NotesRepository {
  final dao = NoteDao();

  @override
  DatabaseProvider databaseProvider;

  NotesDatabaseRepository(this.databaseProvider);

  @override
  Future<Note> insert(Note note) async {
    final db = await databaseProvider.db();
    note.id = await db.insert(dao.tableName, dao.toMap(note));
    return note;
  }

  @override
  Future<Note> delete(Note note) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [note.id]);
    return note;
  }

  @override
  Future<Note> update(Note note) async {
    final db = await databaseProvider.db();
    await db.update(dao.tableName, dao.toMap(note),
        where: dao.columnId + " = ?", whereArgs: [note.id]);
    return note;
  }

  @override
  Future<List<Note>> getNotes() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }
}