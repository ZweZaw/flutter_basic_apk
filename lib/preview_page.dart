import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class PreviewPage extends StatelessWidget {
  String title;
  Widget previewWidget;
  String filePath;
  PreviewPage({Key? key, required this.title, required this.filePath, required this.previewWidget}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:  WidgetWithCodeView(
        filePath: 'filePath',
        child: previewWidget,
      ),
    );
  }
}
