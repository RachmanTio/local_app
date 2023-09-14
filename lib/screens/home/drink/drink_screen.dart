import 'package:flutter/material.dart';

class DrinkPage extends StatefulWidget {
  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        title: Text('Drink'),
      ),
      body: SafeArea(
        child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Text('testtt drink'),
          ),
        ),
      ),
      ),
    );
  }
}
