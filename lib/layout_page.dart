import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/Layouts/Row_Column.dart';
import 'package:flutter_basic_apk/Layouts/container.dart';
import 'package:flutter_basic_apk/Layouts/expanded.dart';
import 'package:flutter_basic_apk/Layouts/stack.dart';
import 'package:flutter_basic_apk/Layouts/wrap.dart';
import 'package:flutter_basic_apk/preview_page.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

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
        title: const Text("Layouts"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text("Container"),
            subtitle: const Text("Basic Widget for Layout"),
            onTap: (){
              gotoPreview("Container", const ContainerExample(), "../lib/Layouts/container.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text("Row & Column"),
            subtitle: const Text("Align Children Linearly"),
            onTap: (){
              gotoPreview("Row & Column", const RowColumnExample(), "../lib/Layouts/Row_Column.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text("Wrap"),
            subtitle: const Text("wrap tp the next row/column when run out or space"),
            onTap: (){
              gotoPreview("Wrap", const WrapExample(), "../lib/Layouts/wrap.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text("Fractionally Size Box"),
            subtitle: const Text("Sizing Widget to a fraction of the total avaiable space"),
            onTap: (){
              gotoPreview("Fractionally Size Box", const FractionallySizedBox(), "../lib/Layouts/fractionally_size_box.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text("Expanded, Size Box"),
            subtitle: const Text("Divding space by weights(flex)"),
            onTap: (){
              gotoPreview("Expanded, Size Box", const ExpandedExample(), "../lib/Layouts/expanded.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title: const Text("Stack"),
            subtitle: const Text("putting widget on top of another"),
            onTap: (){
              gotoPreview("Stack", const StackExample(), "../lib/Layouts/stack.dart");
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
