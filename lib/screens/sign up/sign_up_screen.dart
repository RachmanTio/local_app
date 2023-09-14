import 'package:flutter/material.dart';
import 'package:local_app/screens/sign%20in/sign_in_screen.dart';
import 'package:local_app/screens/sign%20up/components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 0),
          child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
          }),
        ),
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Register Account',
                          style: TextStyle(
                            color: Color(0xFF00AA13),
                            fontWeight: FontWeight.w900,
                            fontSize: 35
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'complete your details and continue',
                          style: TextStyle(
                            color: Color(0xFF00AA13),
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  SignUpForm()
                ],
              )
            ),
          )
        ),
      ),
    );
  }
}