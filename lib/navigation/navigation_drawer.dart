import 'package:flutter/material.dart';
class NavigationDrawerExample extends StatelessWidget {
  const NavigationDrawerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //drawer header widget
    const drawerheader= UserAccountsDrawerHeader(
      accountName: Text("User Name"),
      accountEmail: Text("mgmg1@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: FlutterLogo(size: 45.0),
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: Text("A"),
        ),
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Text("B"),
        ),
      ],
    );

    //drawer items
    final drawerItems= ListView(
      children: [
        drawerheader,
        ListTile(
          leading: const Icon(Icons.inbox),
          title: const Text("Inbox"),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          leading: const Icon(Icons.send),
          title: const Text("Sent Box"),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          leading: const Icon(Icons.label_important_outline),
          title: const Text("Important"),
          onTap: () => Navigator.of(context).push(_NewPage(3)),
        ),
        ListTile(
          leading: const Icon(Icons.mail),
          title: const Text("All mail"),
          onTap: () => Navigator.of(context).push(_NewPage(4)),
        ),
        ListTile(
          leading: const Icon(Icons.drafts),
          title: const Text("Drafts"),
          onTap: () => Navigator.of(context).push(_NewPage(5)),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Setting"),
          onTap: () => Navigator.of(context).push(_NewPage(6)),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Log out"),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text("Help & feedback"),
          onTap: () => Navigator.of(context).push(_NewPage(7)),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Example"),
        backgroundColor: Colors.blueAccent,
      ) ,
      body: const Center(
        child: Text("Swipe or click upper-left icon to see drawer"),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}
class _NewPage extends MaterialPageRoute<void>{
  _NewPage(int id):super(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title:  Text("Page $id"),
            elevation: 1.0,
          ),
          body: Center(
            child: Text("Page $id"),
          ),
        );
      }
  );
}
