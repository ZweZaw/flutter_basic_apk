import 'package:flutter/material.dart';
class BottomTabBarExample extends StatefulWidget {
  const BottomTabBarExample({Key? key}) : super(key: key);

  @override
  State<BottomTabBarExample> createState() => _BottomTabBarExampleState();
}

class _BottomTabBarExampleState extends State<BottomTabBarExample> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  static const _tabpages= [
    Center(child: Icon(Icons.cloud_circle_outlined,size: 64, color: Colors.teal)),
    Center(child: Icon(Icons.alarm_add_outlined,size: 64, color: Colors.blueGrey)),
    Center(child: Icon(Icons.forum_outlined,size: 64, color: Colors.yellowAccent)),
  ];
  static const _tabs=<Tab>[
    Tab(icon: Icon(Icons.cloud_circle_outlined),text: 'Cloud'),
    Tab(icon: Icon(Icons.alarm_add_outlined),text: 'Alarm'),
    Tab(icon: Icon(Icons.forum_outlined),text: 'Forum'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController= TabController(
      length: _tabpages.length,
      vsync: this,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.flutter_dash,size: 65),
        title: const Text("Bottom Tab Bar"),
        backgroundColor: Colors.lightBlue,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabpages,
      ),
      bottomNavigationBar: Material(
        color: Colors.lightBlue,
        child: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
