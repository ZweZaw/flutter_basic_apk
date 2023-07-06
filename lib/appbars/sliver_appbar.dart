import 'package:flutter/material.dart';
class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.brown,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Flexible Space Title"),
              background: Image.asset("images/img1.png",fit: BoxFit.fill),

            ),
          ),
          const SliverFillRemaining(
            child:  Center(child: Text("Hello EveryBody")),
          ),
        ],
      ),
    );
  }
}
