import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class GridListExample extends StatelessWidget {
  const GridListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(100, (index){
        return Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 3.0)
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text("Item $index", style: Theme.of(context).textTheme.headline4),
          ),
        );
      }),
    );
  }
}
