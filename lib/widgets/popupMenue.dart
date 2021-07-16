import 'dart:ui';

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
    return PopupMenuButton<IconMenue>(
      itemBuilder: (context) => IconsMenue.items
          .map(
            (item) => PopupMenuItem<IconMenue>(
              child: ListTile(
                title: Text(
                  item.text,
                  style: TextStyle(
                      color: Color(0xFF849ae3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                leading: Icon(item.icon, color: Color(0xFF849ae3)),
                contentPadding: EdgeInsets.zero,
              ),
              value: item,
            ),
          )
          .toList(),
      onSelected: (value) {
        switch (value) {
          case IconsMenue.search:
            showSearch(context: context, delegate: SearchBar());
            break;

          case IconsMenue.delete:
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    backgroundColor: Colors.white,
                    title: Text(
                      'Delete Notes',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF849ae3)),
                    ),
                    content: Text(
                      'Are you sure you want to delete All notes?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('No',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          TextButton(
                              onPressed: () {
                                controller.deleteAllNote();
                                Get.back();
                              },
                              child: Text('Yes',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                         
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
