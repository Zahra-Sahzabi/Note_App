import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';
import 'package:note_app/screens/add_note.dart';
import 'package:note_app/widgets/List_view.dart';
import 'package:note_app/widgets/popupMenue.dart';

class HomePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  Widget emptyNotes() {
    return Container(
        child: Center(
      child: Text("You don't have any notes",
          style: TextStyle(
            fontSize: 25,
            shadows: [
              Shadow(
                blurRadius: 6.0,
                color: Colors.deepPurple,
                offset: Offset(5.0, 5.0),
              ),
            ],
          )),
    ));
  }

  Widget viewNotes() {
    return ListVieww(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e3f1),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Color(0xffe4e3f1),
        elevation: 0,
        actions: [PopupMenue(controller: controller)],
        title: Text(
          'Notes',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: GetBuilder<NoteController>(
          builder: (_) => controller.isEmpty() ? emptyNotes() : viewNotes()),
      floatingActionButton: Tooltip(
        message: 'New Note',
        child: FloatingActionButton(
          child: Icon(
            Icons.edit,
          ),
          onPressed: () => Get.to(NotePage(NoteMode.adding)),
        ),
      ),
    );
  }
}
