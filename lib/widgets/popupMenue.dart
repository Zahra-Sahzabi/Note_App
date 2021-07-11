import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';
import 'package:note_app/models/popupText.dart';
import 'package:note_app/widgets/search.dart';

class PopupMenue extends StatelessWidget {
  const PopupMenue({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final NoteController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => PopupText.items
          .map(
            (item) => PopupMenuItem(
              child: Text(item),
              value: item,
            ),
          )
          .toList(),
      onSelected: (value) {
        switch (value) {
          case PopupText.search:
            showSearch(context: context, delegate: SearchBar());
            break;

          case PopupText.deleteNotes:
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Delete Notes',
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      'Are you sure you want to delete All notes?',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                controller.deleteAllNote();
                                Get.back();
                              },
                              child:
                                  Text('Yes', style: TextStyle(fontSize: 18))),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child:
                                  Text('No', style: TextStyle(fontSize: 18))),
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
