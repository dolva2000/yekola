import 'package:flutter/material.dart';

class TextfielWidget extends StatelessWidget {
  const TextfielWidget({
    super.key,
    required this.hintText,
    required this.maxLine,
  });
  final String hintText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText),
        maxLines: maxLine,
      ),
    );
  }
}
