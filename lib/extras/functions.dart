import 'package:flutter/material.dart';
import 'package:temp/widgets/LoaderDialog.dart';

class Functions {
  static showLoaderDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return const Loading();
        });
  }
}
