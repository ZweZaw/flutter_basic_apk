
import 'package:flutter/material.dart';
//Entry class
class Entry{
  final String title;
  final List<Entry> children;
  const Entry(this.title, [this.children= const<Entry>[]]);
}
// Data Model
const List<Entry>data= [
  Entry(
      'Chapter A',
      <Entry>[
        Entry(
            'Section A0',
            <Entry>[
              Entry('Item A0.1'),
              Entry('Item A0.2')
            ]
        ),
        Entry('Section A1'),
        Entry('Section A2'),
      ]
  ),
  Entry(
      'Chapter B',
      <Entry>[
        Entry('Section B0'),
        Entry('Section B1'),
      ]
  ),

];
class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return EntryItem(data[index]);
        },
      ),
    );
  }
}

class EntryItem extends StatelessWidget {
  final Entry entry;
  const EntryItem(this.entry, {super.key});

  Widget _buildTiles(Entry root){
    if(root.children.isEmpty) return ListTile(title: Text(root.title),);
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

