import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/db/Database.dart';
import 'package:note_app/models/note.dart';
import 'package:string_stats/string_stats.dart';

class NoteController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  var notes = <Note>[];
  List<Note> get reversedNote {
    return notes.reversed.toList();
  }
  int contentWordCount = 0;
  int contentCharCount = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllNotes();
    super.onInit();
  }

  bool isEmpty() {
    if (notes.length == 0)
      return true;
    else
      return false;
  }

  void getAllNotes() async {
    notes = await DatabaseHelper.instance.getNoteList();
    update();
  }

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
    Note note = Note(
      title: title,
      content: content,
      dateTimeEdited: DateFormat.yMMMMd().format(DateTime.now()),
      dateTimeCreated: DateFormat.yMMMMd().format(DateTime.now()),
    );
    await DatabaseHelper.instance.addNote(note);
    contentWordCount = wordCount(content);
    contentCharCount = charCount(content);
    titleController.text = '';
    contentController.text = '';
    getAllNotes();
    Get.back();
  }

  void deleteNote(int id) async {
    Note note = Note(id: id);
    await DatabaseHelper.instance.deleteNote(note);
    getAllNotes();
  }

  void deleteAllNote() async {
    await DatabaseHelper.instance.deleteAllNotes();
    getAllNotes();
  }

  void updateNote(int id, String dTCreated) async {
    final title = titleController.text;
    final content = contentController.text;
    Note note = Note(
      id: id,
      title: title,
      content: content,
      dateTimeEdited: DateFormat.yMMMMd().format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await DatabaseHelper.instance.updateNote(note);
    contentWordCount = wordCount(content);
    contentCharCount = charCount(content);
    titleController.text = '';
    contentController.text = '';
    getAllNotes();
    Get.back();
  }
}
