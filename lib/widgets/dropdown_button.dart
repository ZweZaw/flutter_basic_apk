import 'package:flutter/material.dart';
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static  const menuItems= <String>[
    "One", "Two", "Three", "Four"
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems.map(
          (String value)=> DropdownMenuItem(
          value: value,
          child: Text(value)
      )
  ).toList();
  final List<PopupMenuItem<String>>_popUpMenuItems = menuItems.map(
          (String value)=> PopupMenuItem(
          value: value,
          child: Text(value)
      )
  ).toList();
  String _btn1SelectedVal= "One";
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: const Text("DropDownButton with default:"),
            textColor: Colors.blueAccent,
            trailing: DropdownButton<String>(
              value: _btn1SelectedVal,
              onChanged: (String? newValue){
                if(newValue!= null){
                  setState(() {
                    _btn1SelectedVal = newValue;
                  });
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          ListTile(
            title: const Text("DropDownButton with hints"),
            tileColor: Colors.redAccent,
            trailing: DropdownButton<String>(
              value: _btn2SelectedVal,
              hint: const Text("Choose"),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _btn2SelectedVal = newValue;
                  });
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          ListTile(
            title: const Text("Popup Menu Button:"),
            tileColor: Colors.yellowAccent,
            trailing: PopupMenuButton<String>(
              onSelected: (String newValue){
                _btn3SelectedVal = newValue;
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_btn3SelectedVal))
                );
              },
              itemBuilder: (BuildContext context) => _popUpMenuItems,
            ),
          ),
        ],
      ),
    );
  }
}
