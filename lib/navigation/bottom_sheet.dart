import 'package:flutter/material.dart';
class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  //Globalkey is need to show bottom sheet
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Container buildBottomSheet(BuildContext context){
      return Container(
        height: 300,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView(
          children: [
            const ListTile(title: Text("Bottom Sheet")),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.attach_money_outlined),
                iconColor: Colors.pinkAccent,
                labelText: "Enter an integer",
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.save),
                label: const Text("Save & Close"),
              ),
            ),
          ],
        ),
      );
    };
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _scaffoldKey.currentState?.showBottomSheet((context){
                return buildBottomSheet(context);
              }),
              child: const Text("Show Bottom Sheet"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (ctx) => buildBottomSheet(ctx),
              ),
              child: const Text("Show modal bottom sheet"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
