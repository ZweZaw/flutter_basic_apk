import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //show toast method
    void _ShowToast() => Fluttertoast.showToast(
        msg: "Button Tapped",
        toastLength: Toast.LENGTH_LONG);
    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:  Text("Button Tapped"),
        duration: Duration(microseconds: 500),
      ),
    );
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Column(
            children: [
              const Text("Raised Buttons"),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _showSnack,
                    child: const Text("Elevated Button"),
                  ),
                  const ElevatedButton(
                      onPressed: null,
                      child: Text("Disable Elevated Button")
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              const Text("Float Buttons"),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: _ShowToast,
                    child: const Text("Text Button"),
                  ),
                  const TextButton(
                    onPressed: null,
                    child: Text("Disabled Text Button"),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              const Text("Outline Buttons"),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: _showSnack,
                    child: const Text("Outline Button"),
                  ),
                  const OutlinedButton(
                      onPressed: null,
                      child: Text("Disabled Outline Button")
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              const Text("Tooltips"),
              Center(
                child: IconButton(
                  icon: const Icon(Icons.call),
                  iconSize: 32.0,
                  onPressed: _showSnack,
                  tooltip: "Place a phone call",
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
