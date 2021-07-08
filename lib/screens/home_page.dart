import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_contoller.dart';
import 'package:note_app/screens/add_note.dart';
import 'package:note_app/widgets/alertdialog_widget.dart';

class HomePage extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  Widget emptyNotes() {
    return Container(
      child: Center(
        child: Text("You don't have any notes"),
      ),
    );
  }

  Widget viewNotes() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(NotePage(NoteMode.edditing)),
            onLongPress: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                      confirmFunction: (){},
                      contentText: "Are you sure you want to delete the note?",
                      declineFunction: () {});
                }),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                  child: ListTile(
                title: Text(controller.reversedNote[index].title!),
                subtitle: Text(controller.reversedNote[index].content!),
              )),
            ),
          );
        },
        itemCount: controller.reversedNote.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4e3f6),
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: GetBuilder<NoteController>(
          builder: (_) => controller.isEmpty() ? emptyNotes() : viewNotes()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Get.to(NotePage(NoteMode.adding)),
      ),
    );
  }
}
