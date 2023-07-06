import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/appbars/backdrop.dart';
import 'package:flutter_basic_apk/appbars/basic_appbar.dart';
import 'package:flutter_basic_apk/appbars/bottom_appbar.dart';
import 'package:flutter_basic_apk/appbars/convex_appbar.dart';
import 'package:flutter_basic_apk/appbars/hidable_bottom_bar.dart';
import 'package:flutter_basic_apk/appbars/search_bar.dart';
import 'package:flutter_basic_apk/appbars/sliver_appbar.dart';
import 'package:flutter_basic_apk/preview_page.dart';




class AppBarPage extends StatelessWidget {
  const AppBarPage({Key? key}) : super(key: key);

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
        title: const Text("AppBar"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Basic AppBar"),
            onTap: (){
              gotoPreview("Basic AppBar", const BasicAppBarExample(), "../lib/appbars/basic_appbar.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Bottom AppBar and Floating App Button(FAB)"),
            onTap: (){
              gotoPreview("Bottom AppBar and Floating App Button(FAB)", const BottomAppBarExample(), "../lib/appbars/bottom_appbar.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Sliver AppBar"),
            subtitle: const Text("Appbar that auto-hides"),
            onTap: (){
              gotoPreview("Sliver AppBar", const SliverAppBarExample(), "../lib/appbars/sliver_appbar.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Search Bar"),
            onTap: (){
              gotoPreview("Search bar", const SearchBarExample(), "../lib/appbars/search_bar.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Backdrop"),
            subtitle: const Text("Switching between front and back layer"),
            onTap: (){
              gotoPreview("Backdrop", const BackDropExample(), "../lib/appbars/backdrop.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Convex AppBar"),
            subtitle: const Text("Nicer-looking appbar(Flutter Favorite Page)"),
            onTap: (){
              gotoPreview("Convex AppBar", const ConvexAppbarExample(), "../lib/appbars/convex_appbar.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Hittable Bottom Bar"),
            subtitle: const Text("Bottom bar that auto hides when scroll down"),
            onTap: (){
              gotoPreview("Hittable Bottom Bar", const HidableBottomBarExample(), "../lib/appbars/hidable_bottom_bar.dart");
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
