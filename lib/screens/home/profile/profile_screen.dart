import 'package:flutter/material.dart';
import 'package:local_app/screens/home/profile/components/body_profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w900
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(icon: Icon(Icons.edit), color: Colors.red, onPressed: (){}),
          ),
        ],
      ),
      body: BodyProfile(),
    );
  }
}