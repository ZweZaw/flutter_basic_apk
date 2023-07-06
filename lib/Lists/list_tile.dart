import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ListTileExample extends StatelessWidget {
  const ListTileExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  const [
          ListTile(
            title: Center(
              child: Text(
                "Tile 1 with text widget",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 26.0,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.face),
            tileColor: Colors.blueAccent,
            title: Center(
              child: Text(
                "Tile 2: title with leading, text widget and trailing",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            trailing: Icon(Icons.tag_faces),
          ),
          Divider(),
          ListTile(
            title: Text("Tile: tile 3"),
            isThreeLine: true,
            subtitle: Text("hello"),
          ),
          Divider(),
          ListTile(
            title: Text("Tile 4: dense"),
          ),

        ],
      ),
    );
  }
}
