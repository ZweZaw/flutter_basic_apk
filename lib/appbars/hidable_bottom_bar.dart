import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
class HidableBottomBarExample extends StatefulWidget {
  const HidableBottomBarExample({Key? key}) : super(key: key);

  @override
  State<HidableBottomBarExample> createState() => _HidableBottomBarExampleState();
}

class _HidableBottomBarExampleState extends State<HidableBottomBarExample> {
  int _index=0;
  final _scrollContronller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 80,
          color: Colors.primaries[index %  Colors.primaries.length],
        ),
        controller: _scrollContronller,
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: 50,
      ),
      bottomNavigationBar: Hidable(
        controller: _scrollContronller ,
        wOpacity: true,
        child: BottomNavigationBar(
          onTap: (index)=> setState((){
            _index = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.amber.withOpacity(.9),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: Colors.blue.withOpacity(.9),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.green.withOpacity(.9),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.purple.withOpacity(.9),
            ),
          ],
          currentIndex: _index,
        ),
      ),
    );
  }
}
