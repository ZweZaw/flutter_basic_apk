import 'package:flutter/material.dart';
class ExpandedExample extends StatelessWidget {
  const ExpandedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                color: Colors.red,
                child: const Text("Item1: Flex1"),
              )
          ),
          const SizedBox(height: 20),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
                child: const Text("Item2: Flex2"),
              )
          ),
          const SizedBox(height: 20),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: const Text("Item3: Flex3"),
              )
          ),
          const SizedBox(height: 20),
          Expanded(
              flex: 7,
              child: Container(
                color: Colors.teal,
                child: const Text("Item4 : Flex7"),
              )
          )
        ],
      ),
    );
  }
}