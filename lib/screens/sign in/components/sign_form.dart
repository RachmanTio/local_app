import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_app/providers/auth_provider.dart';
import 'package:local_app/screens/home/food/food_screen.dart';
import 'package:local_app/screens/home/home_screen.dart';
import 'package:local_app/screens/sign%20up/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool? remember = false;
  bool hidden = true;
  void visible() {
    setState(() {
      hidden = !hidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      if (await authProvider.login(
        email: email.text,
        password: password.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFF35A29F),
          content: Text(
            'Berhasil Login',
            textAlign: TextAlign.center,
          ),
        ));
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xFFFF6969),
          content: Text(
            'Gagal Login',
            textAlign: TextAlign.center,
          ),
        ));
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
          Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(Color(0xFF00AA13)),
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text(
                'remember me',
                style: TextStyle(
                    color: Color(0xFF00AA13),
                    fontWeight: FontWeight.w600,
                    fontSize: 13),
              ),
              Spacer(),
              GestureDetector(
                child: Text(
                  'forgot password',
                  style: TextStyle(
                      color: Color(0xFF00AA13),
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
              )
            ],
          ),
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
                    handleSignIn();
                  }
                  return null;
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
                  text: "Don't have account?",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              TextSpan(
                  text: ' Sign Up',
                  style: TextStyle(
                      color: Color(0xFF00AA13), fontWeight: FontWeight.w600),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SignUpScreen();
                      }));
                    })
            ]),
          )
        ],
      ),
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
        ),
      ),
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
        ),
      ),
      cursorColor: Color(0xFF00AA13),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
