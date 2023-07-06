import 'package:flutter/material.dart';
class DraggableScrollableSheetExample extends StatelessWidget {
  const DraggableScrollableSheetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Scrollable Sheet"),
      ),
      body : Stack(
        children: [
          SizedBox.expand(
            child: Container(
              color: Colors.red,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) => Container(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                  )
              ),
              child: Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.ac_unit),
                      title: Text("Item $index"),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
