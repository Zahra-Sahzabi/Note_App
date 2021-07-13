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
           deleteDialog() {
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
                          child: Text('No', style: TextStyle(fontSize: 18))),
                      TextButton(
                          onPressed: () {
                            controller.deleteNote(controller.reversedNote[index].id!);
                            Get.back();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                ]);
          }

          return GestureDetector(
            onTap: () => Get.to(NoteDetail(),
                arguments: {"key1": index, "key2": deleteDialog()}),
            onLongPress: () => showDialog(
                context: context,
                builder: (context) {
                  return deleteDialog();
                }),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Card(
                  child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    //main notes order
                    controller.reversedNote[index].title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff090952)),
                  ),
                ),
                subtitle: Text(controller.reversedNote[index].content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    )),
                trailing: Text(controller.reversedNote[index].dateTimeCreated!),
              )),
            ),
          );
        },
        itemCount: controller.notes.length);
  }
}
