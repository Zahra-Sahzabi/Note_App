import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';
import 'package:note_app/screens/detail_note.dart';
import 'package:note_app/screens/home_page.dart';

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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))),
                backgroundColor: Colors.white,
                title: Text(
                  'Delete Note',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF849ae3)),
                ),
                content: Text(
                  "Are you sure you want to delete the note?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
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
                            controller
                                .deleteNote(controller.reversedNote[index].id!);
                            Get.offAll(HomePage());
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
              padding: const EdgeInsets.only(right: 13, left: 13, top: 8),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28.0)),
                  ),
                  color: Color(0xFF849ae3),
                  margin: EdgeInsets.zero,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        //main notes order
                        controller.reversedNote[index].title!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    subtitle: Text(
                      controller.reversedNote[index].content!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    trailing: Text(
                        controller.reversedNote[index].dateTimeCreated!,
                        style: Theme.of(context).textTheme.subtitle1),
                  )),
            ),
          );
        },
        itemCount: controller.notes.length);
  }
}
