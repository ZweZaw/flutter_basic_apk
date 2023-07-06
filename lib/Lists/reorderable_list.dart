import 'package:flutter/material.dart';
class ReorderableListExample extends StatefulWidget {
  const ReorderableListExample({Key? key}) : super(key: key);

  @override
  State<ReorderableListExample> createState() => _ReorderableListExampleState();
}

class _ReorderableListExampleState extends State<ReorderableListExample> {
  bool _reverseSort = false;
  final List<String> _items = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").toList();
  void _onReorder(int oldIndex, int newIndex){
    print("Old Index is $oldIndex and New Index is $newIndex");
    setState(() {
      final updateIndex = newIndex > oldIndex ? newIndex -1 : newIndex;
      final item = _items.removeAt(oldIndex);
      _items.insert( updateIndex, item);
    });
  }
  void _onSort(){
    setState(() {
      _reverseSort = !_reverseSort;
      _items.sort((a, b)=> _reverseSort ? b.compareTo(a) : a.compareTo(b));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable List"),
        actions: [
          IconButton(
              onPressed: ()=>   _onSort(),
              icon: const Icon(Icons.sort_by_alpha)
          ),
        ],
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: [
          for(final item in _items)
            ListTile(
              key: Key(item),
              title: Text("Item $item Index: ${_items.indexOf(item)}"),
            ),
        ],
      ),
    );
  }
}
