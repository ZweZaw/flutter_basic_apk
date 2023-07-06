import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({Key? key}) : super(key: key);

  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordKey=
  GlobalKey<FormFieldState<String>>();
  //nullable
  String? _name;
  String? _phonenumber;
  String? _email;
  String? _password;
  // Variable တွေရှေ့မှာ _ ခံရေးရင် ၎င်း variable တွေသည် ထို class များနှင့်သာ သက်ဆိုင်နေမည်ဖြစ်ပါသည်။
  // တနည်းအားဖြင့် private variable တွေ ဖြစ်သွားမှာ ဖြစ်ပါသည်။

// validator function or method
  String? _validateName(String? value){
    if(value?.isEmpty ??false){
      return 'Name is required!';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if(!nameExp.hasMatch(value!)){
      return 'Please Enter Only alphabetical character!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Widget တစ်ခု (သို့) UI တစ်ခုကို return ပြန်လာမယ်.. form တွေကို return ပြန်လာမှာဖြစ်သည့်အတွက်
    // Singlechildscollview ကို အသုံးပြုရမည်ဖြစ်သည်။ form တွေအများကြီး return ပြန်လာမည့် အလုပ်တွေ ရှိသည့်အတွက်ကြောင့် ဖြစ်သည်။
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            //"name"Form
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person),
                hintText: 'what do people call you?',
                labelText: 'Name *', // * ရဲ့အဓိပ္ပာယ်သည် မဖြစ်မနေ ဖြည့်ပေးပါဟု ဆိုလိုသည်။
              ),
              onSaved: (String? value){
                _name = value;
                print('name=$_name');
              },
              validator: _validateName,
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.phone),
                hintText: 'what is your phone number?',
                labelText: 'Phone Number *',
                prefixText: '+95',
              ),
              keyboardType: TextInputType.phone,
              onSaved: (String? value) {
                _phonenumber =value;
                if (kDebugMode) {
                  print('phonenumber= $_phonenumber');
                }
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            //Email Form
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.email),
                hintText: 'Your email address',
                labelText: 'E-mail *',
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value){
                _email = value;
                if (kDebugMode) {
                  print('email = $_email');
                }
              },
            ),
            //life story form
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell Us Yourself',
                helperText: 'keep it short,this is just demo',
                labelText: 'Life story',
              ),
              maxLines: 5,
            ),
            //salary form
            const SizedBox(height: 24.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.greenAccent),
              ),
            ),
            //password form
            const SizedBox(height: 24.0),
            PasswordField(
              fieldkey: _passwordKey,
              helperText: 'No more than 8 character',
              labelText: 'Password *',
              onFieldSubmitted: (String value){
                setState(() {
                  _password= value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
class PasswordField extends StatefulWidget {
  final Key? fieldkey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  const PasswordField({super.key,
    this.fieldkey,
    this.hintText,
    this.helperText,
    this.labelText,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
  });


  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldkey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
        filled: true,
        hintText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText? Icons.visibility: Icons.visibility_off),
        ),
      ),
    );
  }
}


