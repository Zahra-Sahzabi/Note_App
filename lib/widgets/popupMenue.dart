import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';

class PopupMenue extends StatelessWidget {
  const PopupMenue({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.black,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Delete All Notes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          
        )
      ],
      onSelected: (val) {
        if (val == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('DeleteNotes'),
                  content:
                      Text('Are you sure you want to delete All notes?'),
                  actions: <Widget>[
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              controller.deleteAllNote();
                            },
                            child: Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('No')),
                      ],
                    )
                  ],
                );
              });
        }
      },
    );
  }
}
