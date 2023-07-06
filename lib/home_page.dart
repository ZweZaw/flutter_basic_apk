import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/animation_page.dart';
import 'package:flutter_basic_apk/appbar_page.dart';
import 'package:flutter_basic_apk/async_page.dart';
import 'package:flutter_basic_apk/layout_page.dart';
import 'package:flutter_basic_apk/list_page.dart';
import 'package:flutter_basic_apk/navigation_page.dart';
import 'package:flutter_basic_apk/widget_page.dart';








class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isPreview = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((_){
      setState(() {
        isPreview  = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget splashScreen =  Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration:  const Duration(microseconds: 1),
          margin:  const EdgeInsets.all(8),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.primaries.first,
            borderRadius: BorderRadius.circular(50),
          ),
          curve: Curves.fastOutSlowIn,
          child:  const FlutterLogo(),
        ),
      ),
    );
    Widget homePage = Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Basic App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text("Widgets"),
            onTap: (){
              //Navigate to Widget Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx)=> const WidgetPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Layouts"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(
                builder: (BuildContext ctx)=> const LayoutPage(),
              )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Lists"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(
                builder: (BuildContext ctx)=> const ListPage(),
              )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Appbar"),
            onTap: (){
              //Navigate to Widget Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx)=> const AppBarPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Navigation"),
            onTap: (){
              //Navigate to Widget Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx)=> const NavigationPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text("Async"),
            onTap: (){
              //Navigate to Widget Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx)=> const AsyncPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.animation),
            title: const Text("Animation ( basic )"),
            onTap: (){
              //Navigate to Widget Page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx)=> const AnimationPage(),
                  )
              );
            },
          ),
          const Divider(
            color: Colors.greenAccent,
            height: 10,
          ),


        ],
      ),
    );
    return isPreview ? splashScreen : homePage;
  }
}
