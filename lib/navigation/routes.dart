import 'package:flutter/material.dart';
class RoutesExample extends StatelessWidget {
  static const routeName= "/RoutesExample";
  const RoutesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to MusicPage"),
          onPressed: (){
            Navigator.push(context, _MusicPage());
          },
        ),
      ),
    );
  }
}

class _MusicPage extends MaterialPageRoute<void>{
  _MusicPage():super(
      builder: (BuildContext context){
        return Scaffold(
            appBar: AppBar(
              title: const Text("MusicPage"),
            ),
            body: Center(
              child: ElevatedButton(
                child: const Text("Go to NextPage"),
                onPressed: (){
                  //Navigator.push<T> return a Future<T>, which is the
                  //return value of the pushed route it's popped.
                  Navigator.push(context, _NextPage()).then(
                          (returnVal){
                        if(returnVal !=null){
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("You Clicked: $returnVal"),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: (){},
                              ),
                            ),
                          );
                        }
                      }
                  );
                },
              ),
            )
        );
      }
  );

}

//NextPage will return a future string
class _NextPage extends MaterialPageRoute<String>{
  _NextPage():super(
      builder: (BuildContext context){
        return Scaffold(
            appBar: AppBar(
              title: const Text("Last Page"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(child: Text("1")),
                    title: const Text("user1@gmail.com"),
                    onTap: () => Navigator.pop(context,"user1@gmail.com"),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Text("2")),
                    title: const Text("user2@gmail.com"),
                    onTap: () => Navigator.pop(context,"user2@gmail.com"),
                  ),
                  ListTile(
                    leading: const CircleAvatar(child: Text("3")),
                    title: const Text("user3@gmail.com"),
                    onTap: () => Navigator.pop(context,"user2@gmail.com"),
                  ),
                  const Divider(),
                  MaterialButton(
                    child: const Text("Go Home"),
                    onPressed: (){
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(RoutesExample.routeName),
                      );
                    },
                  ),
                ],
              ),
            )
        );
      }
  );
}