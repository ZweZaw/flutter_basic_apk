import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/Lists/data_table.dart';
import 'package:flutter_basic_apk/Lists/expansion_tile.dart';
import 'package:flutter_basic_apk/Lists/grid_list.dart';
import 'package:flutter_basic_apk/Lists/list_tile.dart';
import 'package:flutter_basic_apk/Lists/list_view_builder.dart';
import 'package:flutter_basic_apk/Lists/list_wheel_view.dart';
import 'package:flutter_basic_apk/Lists/reorderable_list.dart';
import 'package:flutter_basic_apk/Lists/slidable_tile.dart';
import 'package:flutter_basic_apk/Lists/swipe_to_dismiss.dart';
import 'package:flutter_basic_apk/preview_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    void gotoPreview(String title, Widget previewWidget, String filePath){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx)=>  PreviewPage(
              title: title,
              previewWidget: previewWidget,
              filePath: filePath,
            ),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
        backgroundColor : Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("ListTile"),
            onTap: () {
              gotoPreview("ListTile", const ListTileExample(),"../lib/Lists/list_tile.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("ListView.Builder"),
            subtitle: const Text("Building List items with a builder"),
            onTap: () {
              gotoPreview("List View Builder", const ListViewBuilder(),"../lib/Lists/listview_builder.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("GridList"),
            onTap: () {
              gotoPreview("GridList", const GridListExample(),"../lib/Lists/grid_list.dart");
            },
          ) ,
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("ExpansionTile"),
            onTap: () {
              gotoPreview("ExpansionTile", const ExpansionTileExample(),"../lib/lists/expansion_tile.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Swipe to dismiss"),
            onTap: () {
              gotoPreview("Swipe to Dismiss", const SwipeToDismissExample(),"../lib/lists/swipe_to_dismiss.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Reorderable List"),
            onTap: () {
              gotoPreview("Reorderable", const ReorderableListExample(),"../lib/lists/reorderable_list.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("List Wheel Scroll View"),
            subtitle: const Text("fancy list view"),
            onTap: () {
              gotoPreview("List Wheel Scroll View", const ListWheelViewExample(),"../lib/lists/list_wheel_view.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Slidable List Tile"),
            subtitle: const Text("Nice slidable tile from Flutter Favorite Page"),
            onTap: () {
              gotoPreview("Slidable List Tile", const SlidableTileExample(),"../lib/lists/slidable_tile.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("DataTable"),
            subtitle: const Text("showing data in a table"),
            onTap: () {
              gotoPreview("Data Table", const DataTableExample(),"../lib/lists/data_table.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}


