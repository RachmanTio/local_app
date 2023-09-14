import 'package:flutter/material.dart';
import 'package:local_app/screens/home/navbar_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavbarPage(),
    );
  }
}
