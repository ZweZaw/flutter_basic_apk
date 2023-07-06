
import 'package:flutter/material.dart';

class StatefulWidgetsExample extends StatefulWidget {
  const StatefulWidgetsExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetsExample> createState() => _StatefulWidgetsExampleState();
}

class _StatefulWidgetsExampleState extends State<StatefulWidgetsExample> {
  bool _switchVal = true;
  bool _checkBoxVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int _radioVal= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Text("Switch"),
          Center(
            child: Switch(
              value: _switchVal,
              onChanged: (bool newvalue){
                setState(() {
                  _switchVal= newvalue;
                });
              },
            ),
          ),
          const Text("Disabled Switch"),
          const Center(
            child: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          const Divider(),
          const Text("Checkbox"),
          Checkbox(
              value: _checkBoxVal,
              onChanged: ( bool? newVal) {
                if (newVal != null) {
                  setState(() {
                    _checkBoxVal = newVal;
                  });
                }
              }
          ),
          const Text("Disabled Checkbox"),
          const Checkbox(
              tristate: true,
              value: null,
              onChanged: null
          ),
          const Divider(),
          const Text("Slider"),
          Slider(
              value: _slider1Val,
              onChanged: (double newVal){
                setState(() {
                  _slider1Val = newVal;
                });
              }
          ),
          const Text("Slider with Divisions and label"),
          Slider(
              value: _slider2Val,
              max: 100,
              divisions: 10,
              label: "${_slider2Val.round()}",
              onChanged: (double newVal){
                setState(() {
                  _slider2Val = newVal;
                });
              }
          ),
          const Divider(),
          const Text("Linear Progress Indicator"),
          const LinearProgressIndicator(
            color: Colors.orange,
          ),
          const Divider(),
          const Text("Circular Progress Indicator"),
          const Center(
            child:  CircularProgressIndicator(
              backgroundColor: Colors.yellowAccent,
            ),
          ),
          const Divider(),
          const Text("Radio"),
          Row(
            children: [0,1,2,3].map(
                  (int index) => Radio(
                  value: index,
                  groupValue: _radioVal,
                  onChanged: (int? newVal){
                    if(newVal !=null){
                      setState(() {
                        _radioVal= newVal;
                      });
                    }
                  }
              ),
            ).toList(),
          )

        ],
      ),
    );

  }
}
