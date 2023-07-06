import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        color: Colors.lightGreen,
        padding: const EdgeInsets.all(20.0),
        child:  Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.yellow,
          ),
          padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
          child:  Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.orangeAccent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            transform: Matrix4.rotationZ(-0.1),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                    left: Radius.circular(20),
                  )
              ),
              child: const Center(
                child:  Text(
                  "flutter basic",
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.cyanAccent,
                  ),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
