import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';
import 'package:note_app/screens/detail_note.dart';

class ListVieww extends StatelessWidget {
  const ListVieww({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(NoteDetail(), arguments: index),
            onLongPress: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text(
                        'Delete Note',
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        "Are you sure you want to delete the note?",
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child:
                                    Text('No', style: TextStyle(fontSize: 18))),
                            TextButton(
                                onPressed: () {
                                  controller
                                      .deleteNote(controller.notes[index].id!);
                                  Get.back();
                                },
                                child: Text(
                                  'Yes',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                      ]);
                }),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Card(
                  child: ListTile(
                title: Text(
                  controller.notes[index].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff090952)),
                ),
                subtitle: Text(controller.notes[index].content!),
                trailing: Text(controller.notes[index].dateTimeCreated!),
              )),
            ),
          );
        },
        itemCount: controller.notes.length);
  }
}