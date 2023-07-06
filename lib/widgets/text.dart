
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Simple Text demo",
        style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough
        ),
      ),
    );
  }
}
