import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _numberInputIsValid = true;

  //Function to build number TextField
  Widget _buildNumberTextField(){
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
          icon: const Icon(Icons.attach_money_outlined),
          labelText: 'Enter an integer:',
          errorText: _numberInputIsValid ? null : 'Please enter an integer!',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          )
      ),
      onSubmitted: (val)=> Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
      onChanged: (String val){
        final v = int.parse(val);
        if(v == null){
          setState(() {
            _numberInputIsValid = false;
          });
        }else{
          setState(() {
            _numberInputIsValid = true;
          });
        }
      },
    );
  }

  final _controller  = TextEditingController();
  //Function to build Multiline TextField
  Widget _buildMultilineTextField(){
    return TextField(
      controller: _controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counterText: '${_countWords(text: _controller.text)} words',
          labelText: 'Enter Multiline Text:',
          alignLabelWithHint: true,
          hintText: 'type something...',
          border: const OutlineInputBorder()
      ),
      onChanged: (text)=> setState(() {}),
    );
  }

  //Function to count Words
  int _countWords({required String text}){
    final trimmedText  = text.trim();

    if(trimmedText.isEmpty){
      return 0;
    }else{
      return trimmedText.split(RegExp("\\s+")).length;
    }
  }

  bool _showPassword  = false;

  //Function to build the password field
  Widget _buildPasswordTextField(){
    return TextField(
      obscureText: !_showPassword,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Type Password',
          prefixIcon: const Icon(Icons.security_outlined),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye_outlined,
              color: _showPassword ? Colors.blue : Colors.grey,
            ),
            onPressed: (){
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          )
      ),
    );
  }

  //Function to build bordeless textField
  Widget _buildBorderlessTextField(){
    return const TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: 'borderless input '),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const ListTile(title: Text('1. Number Input Field')),
          _buildNumberTextField(),
          const ListTile(title: Text('2. Multiline Text Field')),
          _buildMultilineTextField(),
          const ListTile(title: Text('3. Password Text Field')),
          _buildPasswordTextField(),
          const ListTile(title: Text('4. Borderless Text Field')),
          _buildBorderlessTextField(),
        ],
      ),
    );
  }
}

