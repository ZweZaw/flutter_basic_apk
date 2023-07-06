import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/animations/animated_container.dart';
import 'package:flutter_basic_apk/animations/animated_icons.dart';
import 'package:flutter_basic_apk/animations/animated_package.dart';
import 'package:flutter_basic_apk/animations/hero.dart';
import 'package:flutter_basic_apk/animations/opacity.dart';
import 'package:flutter_basic_apk/preview_page.dart';


class AnimationPage extends StatelessWidget {
  const AnimationPage({Key? key}) : super(key: key);

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
        title: const Text("Animations"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.animation_outlined),
            title: const Text("Hero"),
            subtitle: const Text("Hero animation between routes"),
            onTap: (){
              gotoPreview("Hero", const HeroExample(), "../lib/animations/hero.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.animation_outlined),
            title: const Text("Opacity"),
            subtitle: const Text("Making a widget transparent/visible"),
            onTap: (){
              gotoPreview("Opacity", const OpacityExample(), "../lib/animations/opacity.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.animation_outlined),
            title: const Text("Animation Icon"),
            subtitle: const Text("Click on the icon to forward/reverse the animation"),
            onTap: (){
              gotoPreview("Animation Icon", const AnimatedIconsExample(), "../lib/animations/animated_icons.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.animation_outlined),
            title: const Text("Animated Container"),
            onTap: (){
              gotoPreview("Animated Container", const AnimatedContainerExample(), "../lib/animations/animated_container.dart");
            },
          ),
          const Divider(
            height: 10,
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.animation_outlined),
            title: const Text("Animations Package"),
            onTap: (){
              gotoPreview("Animations Package", const AnimationPackageExample(), "../lib/animations/animation_package.dart");
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
