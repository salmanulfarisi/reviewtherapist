import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dialogeBox(BuildContext context, String title, String content,
    Color color, Function() onPressed, String buttonText) {
  return CupertinoAlertDialog(
    title: Text(title, style: TextStyle(color: color)),
    content: Text(content),
    actions: [
      CupertinoDialogAction(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      CupertinoDialogAction(
        child: Text(buttonText),
        onPressed: () {
          onPressed().then((value) => Navigator.pop(context));
        },
      ),
    ],
  );
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
