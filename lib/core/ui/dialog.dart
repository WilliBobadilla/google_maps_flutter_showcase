import 'package:flutter/material.dart';

void showSuccessPopup(
  BuildContext context,
  String title,
  String body, {
  void Function()? onAccept,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(body, textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: onAccept ?? () => Navigator.pop(context),
          child: const Text('Aceptar'),
        ),
      ],
    ),
  );
}
