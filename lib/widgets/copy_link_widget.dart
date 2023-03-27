import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CopyLinkWidget extends StatelessWidget {
  String link;
  CopyLinkWidget({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FlutterClipboard.copy(link);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xFFF5E0F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Copy Link"),
          SvgPicture.asset("assets/icons/copyIcon.svg"),
        ],
      ),
    );
  }
}
