import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class SlidableTileExample extends StatefulWidget {
  const SlidableTileExample({Key? key}) : super(key: key);

  @override
  State<SlidableTileExample> createState() => _SlidableTileExampleState();
}

class _SlidableTileExampleState extends State<SlidableTileExample> {
  // create data map for action pane
  static final _kActionpaneTypes = <String, Widget>{
    "DrawerMotion" : const DrawerMotion(),
    "BehindMotion" : const BehindMotion(),
    "ScrollMotion" :  const ScrollMotion(),
    "StretchMotion" : const StretchMotion(),
  };
  late List<Slidable> _items;

  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final mainActions= <Widget>[
      SlidableAction(
        label: "Archive",
        foregroundColor: Colors.redAccent,
        icon: Icons.archive,
        onPressed: (_)=> _showSnackBar("Archive"),
      ),
      SlidableAction(
        label: "Share",
        foregroundColor: Colors.greenAccent,
        icon: Icons.share,
        onPressed: (_)=> _showSnackBar("Share"),
      ),
    ];
    final secondaryActions= <Widget>[
      SlidableAction(
        label: "More",
        foregroundColor: Colors.indigo,
        icon: Icons.more_horiz,
        onPressed: (_)=> _showSnackBar("More"),
      ),
      SlidableAction(
        label: "Delete",
        foregroundColor: Colors.lightBlue,
        icon: Icons.delete,
        onPressed: (_)=> _showSnackBar("Delete"),
      ),
    ];

    _items = [
      for(final entry in _kActionpaneTypes.entries)
        Slidable(
            key: ValueKey(entry.key),
            startActionPane: ActionPane(
              motion: entry.value,
              extentRatio: 0.2,
              children: mainActions,
            ),
            endActionPane: ActionPane(
              motion: entry.value,
              extentRatio: 0.2,
              children: secondaryActions,
            ),
            child:  ListTile(
              leading: const Icon(Icons.swipe),
              title: Text("ListTile with ${entry.key}"),
              subtitle: const Text("Swipe Left and Right to see the actions"),

            )
        )
    ];
    // Dismissible title example;
    // first create a dismissal obj
    final dismissal = DismissiblePane(
      onDismissed: (){
        _showSnackBar("Dismiss Archive");
        setState(() {
          _items.removeAt(_items.length-1);
        });
      },
      confirmDismiss: ()async{
        final bool? result = await showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Archive"),
              content: const Text("Confirm action?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Cancel")
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("Ok")
                ),
              ],
            );
          },
        );
        return result ?? false;
      },
    );

    _items.add(
      Slidable(
        key: const Key("dismissibleTile"),
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          dismissible: dismissal,
          children: [mainActions[0]],
        ),
        endActionPane: ActionPane(
          dismissible: dismissal,
          motion: const DrawerMotion(),
          children: [secondaryActions[1]],
        ),
        child: const ListTile(
          leading: Icon(Icons.swap_horiz),
          title: Text("Dismissible Tile"),
          subtitle: Text("Swipe right to archive, swipe left to delete"),
        ),
      ),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: _items),
    );
  }
}
