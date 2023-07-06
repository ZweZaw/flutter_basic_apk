import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
class AnimationPackageExample extends StatelessWidget {
  const AnimationPackageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const ListTile(
            title: Text("1. OpenContainer"),
            subtitle: Text(
                "A container that grows to fill the screen to reveal new content when tapped"
            ),
          ),
          OpenContainer(
            transitionDuration: const Duration(milliseconds: 500),
            closedBuilder: (context, action) => const ListTile(
              title: Text('click me'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
            openBuilder: (context, action) => const Scaffold(
              body: Center(
                child: Text("new page"),
              ),
            ),
          ),
          const Divider(thickness: 2,color: Colors.black87),
          const ListTile(
            title: Text("2. Page TransitionSwitcher"),
            subtitle: Text(
                "Transition from an old child to a new child, similar to animation switcher"
            ),
          ),
          const SizedBox(
            height: 200,
            child: PageTransitionSwitcherExample(),
          ),
          const Divider(thickness: 2,color: Colors.black87),
          const ListTile(
            title: Text("3. Shared AxisTransition"),
            subtitle: Text(
                "Transition animation between UI elements that have navigational relationship"
            ),
          ),
          const SizedBox(
            height: 300,
            child: ShareAxisExample(),
          ),
          const Divider(thickness: 2,color: Colors.black87),
          const ListTile(
            title: Text("4. showModal()"),
            subtitle: Text(
              "Displays a dialog with animation",
            ),
          ),
          ElevatedButton(
              onPressed: ()=> showModal(
                context: context,
                builder: (ctx) => const AlertDialog(
                  title: Text("New Dialog"),
                  content: Text("This is Dialog"),
                ),
              ),
              child: const Text("Show Dialog")
          )

        ],
      ),
    );
  }
}

class PageTransitionSwitcherExample extends StatefulWidget {
  const PageTransitionSwitcherExample({Key? key}) : super(key: key);

  @override
  State<PageTransitionSwitcherExample> createState() => _PageTransitionSwitcherExampleState();
}

class _PageTransitionSwitcherExampleState extends State<PageTransitionSwitcherExample> {

  static const tabs = <Widget>[
    Icon(Icons.looks_one,size: 48,key: ValueKey(1)),
    Icon(Icons.looks_two,size: 48,key: ValueKey(2)),
  ];

  static const btnNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Tab1',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Tab2',
    )
  ];

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
                animation:   primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: tabs[currentTabIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btnNavbarItems,
        currentIndex: currentTabIndex,
        onTap: (newIndex) => setState(() {
          currentTabIndex = newIndex;
        }),
      ),
    );
  }
}

class ShareAxisExample extends StatefulWidget {
  const ShareAxisExample({Key? key}) : super(key: key);

  @override
  State<ShareAxisExample> createState() => _ShareAxisExampleState();
}

class _ShareAxisExampleState extends State<ShareAxisExample> {

  final pages = const [
    Icon(Icons.looks_one,size: 64,key: ValueKey(1)),
    Icon(Icons.looks_two,size: 64,key: ValueKey(2)),
    Icon(Icons.looks_3,size: 64,key: ValueKey(3)),

  ];
  int currentTabIndex = 0;

  SharedAxisTransitionType transitionType = SharedAxisTransitionType.scaled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: PageTransitionSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                      SharedAxisTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: transitionType,
                        child: child,
                      ),
                  child: pages[currentTabIndex],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: currentTabIndex == 0 ? null : ()=> setState(() {
                        currentTabIndex--;
                      }),
                      child: const Text("BACK")
                  ),
                  TextButton(
                      onPressed: currentTabIndex == 2 ? null : ()=> setState(() {
                        currentTabIndex++;
                      }),
                      child: const Text("NEXT")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

