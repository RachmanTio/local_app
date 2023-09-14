import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_app/screens/home/home_screen.dart';
import 'package:local_app/screens/sign%20up/sign_up_screen.dart';

class SignForm extends StatefulWidget {
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool? remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 90,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: TextStyle(
                color: Color(0xFF00AA13),
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 10,),
          buildEmailFormField(),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                color: Color(0xFF00AA13),
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 10,),
          buildPasswordFormField(),
          Row(
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }
              ),
              Text(
                'remember me',
                style: TextStyle(
                  color: Color(0xFF00AA13),
                  fontWeight: FontWeight.w600,
                  fontSize: 13
                ),
              ),
              Spacer(),
              GestureDetector(
                child: Text(
                  'forgot password',
                  style: TextStyle(
                    color: Color(0xFF00AA13),
                    fontWeight: FontWeight.w600,
                    fontSize: 13
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 90,),
          Container(
            height: 45,
            width: 131,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF00AA13),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return HomePage();
                  }));
                });
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17
                ),
              )
            ),
          ),
          SizedBox(height: 30,),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have account?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                ),
                TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                    color: Color(0xFF00AA13),
                    fontWeight: FontWeight.w600
                  ),
                  recognizer: TapGestureRecognizer()..onTap =() {Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SignUpScreen();
                  }));}
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEBEBEB),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        )
      ),
      cursorColor: Color(0xFF00AA13),
    );
  }
  TextFormField buildPasswordFormField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEBEBEB),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        )
      ),
      cursorColor: Color(0xFF00AA13),
    );
  }
}