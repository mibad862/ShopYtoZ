import 'package:flutter/material.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String postBtnText = "OK",
  String negtBtnText = "CLOSE",
  required Function(String) onSubmit,
}) {
  final controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(labelText: "Enter $title"),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(negtBtnText),
        ),
        TextButton(
          onPressed: () {
            if (controller.text.isEmpty) return;
            onSubmit(controller.text);
            Navigator.pop(context);
          },
          child: Text(postBtnText),
        ),
      ],
    ),
  );
}

showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
