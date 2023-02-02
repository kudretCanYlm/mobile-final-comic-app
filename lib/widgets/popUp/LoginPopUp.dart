import 'package:comic_mobile_app/widgets/texts/content/ContentTextA.dart';
import 'package:flutter/material.dart';

Future<void> LoginPopUpWrongMail(
  BuildContext context,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Incorrect entry'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("No user found for that email."),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> LoginPopUpWrongPassword(
  BuildContext context,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Incorrect entry'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("Wrong password provided for that user."),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
