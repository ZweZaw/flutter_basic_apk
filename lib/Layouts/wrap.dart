import 'package:flutter/material.dart';
class WrapExample extends StatelessWidget {
  const WrapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          //Gap between adjacent chips
          spacing: 8.0,
          //Gap between lines
          runSpacing: 16.0,
          children: [
            'Apple',
            'Orange',
            'Grape',
            'Banana',
            'Pineapple',
            'Strawberry'
          ].map(
                  (String fruit) => Chip(
                avatar: CircleAvatar(
                  child: Text(fruit.substring(0,1)),
                ),
                label: Text(fruit),
              )
          ).toList(),
        ),
      ),
    );
  }
}
