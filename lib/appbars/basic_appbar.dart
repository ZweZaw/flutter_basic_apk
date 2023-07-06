import 'package:flutter/material.dart';
class BasicAppBarExample extends StatelessWidget {
  const BasicAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        leading: const Icon(Icons.tag_faces),
        title: const Text("Basic App Bar"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.directions_bike_outlined)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.directions_bus_outlined)
          ),
          PopupMenuButton(
            itemBuilder: (context){
              return [
                const PopupMenuItem(child: Text("Boat")),
                const PopupMenuItem(child: Text("Train")),
              ];
            },
          ),
        ],
      ),
      body: const Center(
        child:  Text("Hello EveryBody"),
      ),
    );
  }
}
