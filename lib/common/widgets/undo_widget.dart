// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UndoImage extends StatelessWidget {
  const UndoImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(imageUrl),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: const Icon(
            Icons.undo_sharp,
            size: 35,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
