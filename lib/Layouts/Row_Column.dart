import 'package:flutter/material.dart';

class RowColumnExample extends StatefulWidget {
  const RowColumnExample({Key? key}) : super(key: key);

  @override
  State<RowColumnExample> createState() => _RowColumnExampleState();
}

class _RowColumnExampleState extends State<RowColumnExample> {
  static const kElements= <Widget>[
    Icon(Icons.star,size: 50),
    Icon(Icons.star,size: 100),
    Icon(Icons.star,size: 50)
  ];
  bool _isRow= true;
  MainAxisSize _mainAxisSize= MainAxisSize.max;
  MainAxisAlignment _mainAxisAlignment= MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment= CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getBottomBar(),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    return Container(
      color: Colors.greenAccent,
      child: _isRow? Row(
        mainAxisSize: _mainAxisSize,
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        children: kElements,
      ): Column(
        mainAxisSize: _mainAxisSize,
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        children: kElements,
      ),
    );
  }
  Widget _getBottomBar(){
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: _isRow,
                      onChanged: (bool? value){
                        if(value!= null){
                          setState(() {
                            _isRow = value;
                          });
                        }
                      }
                  ),
                  const Text("Row"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: _isRow,
                      onChanged: (bool? value){
                        if (value != null){
                          setState(() {
                            _isRow = value;
                          });
                        }
                      }
                  ),
                  const Text("Column"),
                ],
              ),

            ],
          ),
          ListTile(
            title: const Text("MainAxisSize: "),
            trailing: DropdownButton<MainAxisSize>(
              value: _mainAxisSize,
              onChanged: (MainAxisSize? newVal){
                if(newVal != null){
                  setState(() {
                    _mainAxisSize= newVal;
                  });
                }
              },
              items: MainAxisSize.values.map(
                      (MainAxisSize val) => DropdownMenuItem(
                      value: val,
                      child: Text(val.toString().substring("MainAxisSize.".length))
                  )
              ).toList(),
            ),
          ),
          ListTile(
            title: const Text("mainAisAlignment"),
            trailing: DropdownButton<MainAxisAlignment>(
              value: _mainAxisAlignment,
              onChanged: (MainAxisAlignment? newVal){
                if(newVal != null){
                  setState(() {
                    _mainAxisAlignment =newVal;
                  });
                }
              },
              items: MainAxisAlignment.values.map(
                    (MainAxisAlignment val) => DropdownMenuItem(
                    value: val,
                    child: Text(val.toString().substring("MainAxisAlignment.".length))
                ),
              ).toList(),
            ),
          ),
          ListTile(
            title: const Text("crossAxisAlignment"),
            trailing: DropdownButton<CrossAxisAlignment>(
              value: _crossAxisAlignment,
              onChanged: (CrossAxisAlignment? newVal){
                if(newVal !=null){
                  setState(() {
                    _crossAxisAlignment =newVal;
                  });
                }
              },
              items: CrossAxisAlignment.values.map(
                      (CrossAxisAlignment val) => DropdownMenuItem(
                      value: val,
                      child: Text(val.toString().substring("CrossAxisAlignment.".length))
                  )
              ).toList(),
            ),
          ),

        ],
      ),
    );
  }
}
