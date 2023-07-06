
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Card(
            color: Colors.yellowAccent,
            elevation: 10,
            child: SizedBox(
                height: 150.0,
                child: Row(
                  children: [
                    Expanded(
                      child:Text ("This is card 1"),
                    ),
                  ],
                )

            ),
          ),
          Card(
            color: Colors.blueAccent,
            margin: const EdgeInsets.all(3.0),
            elevation: 0.0,
            child: SizedBox(
              height: 150.0,
              child: InkWell(
                splashColor: Colors.greenAccent,
                onTap: (){},
                child: const Row(
                  children: [
                    Expanded(child: Text("This is card 2 with InkWell"),
                    ),
                  ],
                ),

              ),

            ),
          ),
          const Card(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(30),
              ),
            ),
            child: SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(child: Text("This is card 3 with border radius"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child:Image.asset("images/img1.png",fit: BoxFit.cover),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text("Card 4 (Complex Example)",
                            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: const Text("Share"),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text("Explore"),
                    ),
                  ],
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
