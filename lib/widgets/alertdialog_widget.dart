import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final Function confirmFunction;
  final Function declineFunction;

  AlertDialogWidget(
      {required this.confirmFunction,
      required this.contentText,
      required this.declineFunction});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(contentText),
      actions: [
        TextButton(onPressed: () => declineFunction, child: Text("No")),
        TextButton(onPressed: () => confirmFunction, child: Text("Yes"))
      ],
    );
  }
}
