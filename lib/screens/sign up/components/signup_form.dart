import 'dart:developer';
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_app/providers/auth_provider.dart';
import 'package:local_app/screens/home/food/food_screen.dart';
import 'package:local_app/screens/sign%20in/sign_in_screen.dart';
import 'package:local_app/screens/sign%20up/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'package:local_app/main.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? remember = false;
  int? selectedOption = 1;
  String? jeniskelamin;

  void PilihGender(String? value) {
    setState(() {
      jeniskelamin = value;
    });
  }

  bool hidden = true;
  void visible() {
    setState(() {
      hidden = !hidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      bool result = await authProvider.register(
          username: username.text,
          email: email.text,
          password: password.text,
          jeniskelamin: jeniskelamin.toString());
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF35A29F),
          content: Text(
            'Register Berhasil',
            textAlign: TextAlign.center,
          ),
        ));
        Navigator.pushNamed(context, '/home');
      }
    }

    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Username',
              style: TextStyle(
                  color: Color(0xFF00AA13),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildUserFormField(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: TextStyle(
                  color: Color(0xFF00AA13),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildEmailFormField(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                  color: Color(0xFF00AA13),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: TextStyle(
                  color: Color(0xFF00AA13),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildGenderFormField(),
          SizedBox(
            height: 90,
          ),
          Container(
            height: 45,
            width: 131,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF00AA13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    handleSignUp();
                  }
                  null;
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Already have account?",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' Sign In',
                  style: TextStyle(
                      color: Color(0xFF00AA13), fontWeight: FontWeight.w600),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SignInScreen();
                      }));
                    })
            ]),
          )
        ],
      ),
    );
  }

  TextFormField buildUserFormField() {
    return TextFormField(
      controller: username,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          )),
      cursorColor: Color(0xFF00AA13),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username tidak boleh kosong';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          )),
      cursorColor: Color(0xFF00AA13),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email tidak boleh kosong';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: hidden,
      decoration: InputDecoration(
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(hidden ? Icons.visibility : Icons.visibility_off),
            onPressed: visible,
          ),
          fillColor: Color(0xFFEBEBEB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          )),
      cursorColor: Color(0xFF00AA13),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Row buildGenderFormField() {
    return Row(
      children: [
        Radio(
          value: "Laki Laki",
          groupValue: jeniskelamin,
          activeColor: Color(0xFF00AA13),
          fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
          splashRadius: 20,
          onChanged: (String? value) {
            setState(() {
              PilihGender(value);
            });
          },
        ),
        Text(
          'Laki-laki',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Radio(
          value: "Perempuan",
          groupValue: jeniskelamin,
          activeColor: Color(0xFF00AA13),
          fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
          splashRadius: 20,
          onChanged: (String? value) {
            setState(() {
              PilihGender(value);
            });
          },
        ),
        Text(
          'Perempuan',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        )
      ],
    );
  }
}
