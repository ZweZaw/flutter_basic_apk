import 'dart:math';

import 'package:flutter/material.dart';
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final rand= Random();
  double height = 100;
  double width = 100;
  double radius = 8;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.all(8),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(radius)
              ),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.update),
              label: const Text("Change Random Property"),
              onPressed: ()=> setState(() {
                width = rand.nextInt(100).toDouble()+50;
                height= rand.nextInt(100).toDouble()+50;
                radius = rand.nextInt(50).toDouble()+50;

                color = Color.fromRGBO(
                    rand.nextInt(256),
                    rand.nextInt(256),
                    rand.nextInt(256),
                    1
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
