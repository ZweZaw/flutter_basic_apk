import 'package:flutter/material.dart';
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 100,
        itemBuilder: (context, index){
          int position= index+1;
          return ListTile(
            leading: CircleAvatar(
              child: Text("$position"),
            ),
            title: Text("Tile $position"),
            trailing: const Icon(Icons.dashboard_customize_outlined),
          );
        },
      ),
    );
  }


}


