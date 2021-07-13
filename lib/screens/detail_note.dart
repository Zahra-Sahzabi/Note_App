import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';

class NoteDetail extends StatelessWidget {
  final NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // final int index = ModalRoute.of(context)!.settings.argumentsas int;
    // final Function deleteDialog = ModalRoute.of(context)!.settings.arguments as Function;
    var data = Get.arguments;
    var index = data["key1"];
    var delete = data["key2"];

    controller.titleController.text = controller.reversedNote[index].title!;
    controller.contentController.text = controller.reversedNote[index].content!;

    return Scaffold(
      backgroundColor: Color(0xffe4e3f6),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.updateNote(controller.reversedNote[index].id!,
                    controller.reversedNote[index].dateTimeCreated!);
              },
              icon: Icon(Icons.check)),
          IconButton(onPressed:()=> showDialog(
                context: context,
                builder: (context) {
                  return delete;
                }), icon: Icon(Icons.delete_rounded))
        ],
        title: Text('Notes'),
        leading: IconButton(
            onPressed: () {
              controller.updateNote(controller.notes[index].id!,
                  controller.notes[index].dateTimeCreated!);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                controller: controller.titleController,
              ),
              TextField(
                  style: TextStyle(fontSize: 20),
                  controller: controller.contentController,
                  decoration: InputDecoration(border: InputBorder.none),
                  maxLines: null)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          controller.updateNote(controller.notes[index].id!,
              controller.notes[index].dateTimeCreated!);
        },
      ),
    );
  }
}
