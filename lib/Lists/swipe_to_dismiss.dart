import 'package:flutter/material.dart';
class SwipeToDismissExample extends StatefulWidget {
  const SwipeToDismissExample({Key? key}) : super(key: key);

  @override
  State<SwipeToDismissExample> createState() => _SwipeToDismissExampleState();
}

class _SwipeToDismissExampleState extends State<SwipeToDismissExample> {
  // [Item 1, Item 2,....,Item 19]
  // _items= List<String>["Item 1", "Item 2",...,"Item 19"];
  final _items= List<String>.generate( 20, (index) => "Item${index+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index){
          //if index= 0; _items[0]; "Item 1"
          final String currentItem= _items[index];
          return Dismissible(
            key: Key(currentItem),
            onDismissed: (direction){
              setState(() {
                _items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(

                    content: Text(
                        direction == DismissDirection.startToEnd ?
                        "$currentItem removed" : "$currentItem liked."
                    ),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: (){
                        setState(() {
                          _items.insert(index, currentItem);
                        });
                      },
                    ),
                  )
              );
            },
            // Show a red background as the item is swipe away
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete),
            ),
            secondaryBackground: Container(
              color: Colors.greenAccent,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.thumb_up),
            ),
            child: ListTile(
              title: Center(child: Text(currentItem)),
            ),

          );

        },
      ),
    );
  }
}
