import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_app/screens/sign%20in/sign_in_screen.dart';
import 'package:local_app/screens/sign%20up/sign_up_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool? remember = false;
  int? selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 90,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Username',
              style: TextStyle(
                color: Color(0xFF00AA13),
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 10,),
          buildUserFormField(),
          SizedBox(height: 10,),
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
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: TextStyle(
                color: Color(0xFF00AA13),
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
            ),
          ),
          SizedBox(height: 10,),
          buildGenderFormField(),
          SizedBox(height: 90,),
          Container(
            height: 45,
            width: 131,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF00AA13),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){},
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
                  text: "Already have account?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)
                ),
                TextSpan(
                  text: ' Sign In',
                  style: TextStyle(
                    color: Color(0xFF00AA13),
                    fontWeight: FontWeight.w600
                  ),
                  recognizer: TapGestureRecognizer()..onTap =() {Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SignInScreen();
                  }));}
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildUserFormField() {
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
  Row buildGenderFormField() {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: selectedOption,
          activeColor: Color(0xFF00AA13),
          fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
          splashRadius: 20,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        Text(
          'Laki-laki',
          style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
        ),
        Radio(
          value: 2,
          groupValue: selectedOption,
          activeColor: Color(0xFF00AA13),
          fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
          splashRadius: 20,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        ),
        Text(
          'Perempuan',
          style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15
              ),
        )
      ],
    );
  }
}