import 'package:flutter/material.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        'Welcome Back',
                        style: TextStyle(
                          color: Color(0xFF00AA13),
                          fontWeight: FontWeight.w900,
                          fontSize: 35
                        ),
                      ),
                      Text(
                        'sign in with tour acoount',
                        style: TextStyle(
                          color: Color(0xFF00AA13),
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ),
                SignForm()
              ],
            )
          ),
        )
      ),
    );
  }
}