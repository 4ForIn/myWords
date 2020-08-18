import 'package:flutter/material.dart';

class CustomDialogAlert {
  static Future<AlertDialog> buildDialog({
    BuildContext context,
    String title,
    String content,
    VoidCallback onPressedFn,
    VoidCallback onPressedCancel,
  }) {
    return showDialog<AlertDialog>(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 5,
        title: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            onPressed: onPressedFn,
            child: const Text('OK'),
          ),
          // ignore: prefer_if_elements_to_conditional_expressions
          onPressedCancel != null
              ? FlatButton(
                  onPressed: onPressedCancel,
                  child: const Text('Cancel'),
                )
              : null,
        ],
      ),
    );
  }
}
