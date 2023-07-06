import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Lessons'),
        centerTitle: false,
        leading: const FlutterLogo(),
        actions: [
          IconButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('Settings snackbar'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(label: 'Undo', onPressed: () {},
                    textColor: Colors.white,),)
            );
          }, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('Sent Message'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(label: 'Unsent', onPressed: () {},
                    textColor: Colors.white,),)
            );
          }, icon: const Icon(Icons.message)),
        ],
        backgroundColor: Colors.redAccent,
        toolbarHeight: 100,
        elevation: 30,
        shadowColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}