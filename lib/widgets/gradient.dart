import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'dart:math'show pi;
class GradientExample extends StatelessWidget {
  const GradientExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtStyle= Theme.of(context).textTheme.headline4;

    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Text("Gradient AppBar"),
        gradient: const LinearGradient(
            colors: [Colors.indigo,Colors.cyan]
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.yellow,Colors.red,Colors.yellowAccent]
              ),
            ),
            child: Text('Linear Gradient',style: txtStyle ),
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    radius: 0.7,
                    colors:[Colors.blueAccent,Colors.redAccent] )
            ),
            child:  Text("Radial Gradient",style: txtStyle),
          ),
          const Divider(),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                startAngle: pi/6,
                endAngle: pi*1.8,
                colors:[Colors.blue,Colors.yellow, Colors.redAccent],
              ),
            ),
            child: Text("Sweep Gradient",style: txtStyle),
          ),
        ],
      ),

    );
  }
}
