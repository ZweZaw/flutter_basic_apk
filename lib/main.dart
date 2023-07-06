import 'package:flutter/material.dart';
import 'package:flutter_basic_apk/animations/animated_package.dart';
import 'package:flutter_basic_apk/home_page.dart';
import 'package:flutter_basic_apk/navigation/routes.dart';
import 'package:flutter_basic_apk/widgets/appbar.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Apk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBarWidget(),
      //initialRoute: RoutesExample.routeName,
      routes: {
        RoutesExample.routeName :(context) => const RoutesExample(),
      },
    );
  }

}




