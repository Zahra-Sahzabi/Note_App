import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';

enum NoteMode { edditing, adding }

class NotePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());
  final NoteMode noteMode;
  NotePage(this.noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e3f6),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.addNoteToDatabase();
              },
              icon: Icon(Icons.check))
        ],
        title: Text(
          noteMode == NoteMode.adding ? 'Add Note' : 'Edit Note',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              textAlign: TextAlign.center,
              maxLines: 1,
              decoration: InputDecoration(hintText: 'Title'),
              style: Theme.of(context).textTheme.headline2
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.contentController,
               style: Theme.of(context).textTheme.headline3,
              decoration:
                  InputDecoration(hintText: 'Note', border: InputBorder.none),
              maxLines: null,
            )
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Save',
        child: FloatingActionButton(
          onPressed: () {
            controller.addNoteToDatabase();
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}
