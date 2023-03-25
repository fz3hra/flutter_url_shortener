import 'package:flutter/material.dart';

extension CommonPadding on Container {
  Container addPadding() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 78,
        horizontal: 16,
      ),
      child: this,
    );
  }
}
