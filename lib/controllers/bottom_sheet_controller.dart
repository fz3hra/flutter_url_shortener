import 'package:flutter/material.dart';

class BottomSheetController {
  static void showSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(32),
          height: MediaQuery.of(context).size.height * 0.30,
          child: child,
        );
      },
    );
  }
}
