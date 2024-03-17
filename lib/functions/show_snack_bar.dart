import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String snackText) {
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(
    content: Text(snackText),
  )));
}
