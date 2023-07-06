import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/async/future_builder.dart';
import 'package:flutter_basic_apk/async/stream_builder.dart';
import 'package:flutter_basic_apk/preview_page.dart';


class AsyncPage extends StatelessWidget {
  const AsyncPage({Key? key}) : super(key: key);

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
        title: const Text("Async"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.build_outlined),
            title: const Text("Future Builder"),
            onTap: (){
              gotoPreview("Future Builder", const FutureBuilderExample(), "../lib/async/future_builder.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.build_outlined),
            title: const Text("StreamBuilder(timer app)"),
            subtitle: const Text("Update UI according to the last stream value"),
            onTap: (){
              gotoPreview("StreamBuilder(timer app)", const StreamBuilderExample(), "../lib/async/stream_builder.dart");
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
