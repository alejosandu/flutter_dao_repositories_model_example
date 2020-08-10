import 'package:sqflite_dao_repositorios_models/src/model/note_model.dart';
import 'package:sqflite_dao_repositorios_models/src/provider/db_provider.dart';

abstract class NotesRepository {
  DatabaseProvider databaseProvider;

  Future<Note> insert(Note note);
  
  Future<Note> update(Note note);

  Future<Note> delete(Note note);

  Future<List<Note>> getNotes();
}