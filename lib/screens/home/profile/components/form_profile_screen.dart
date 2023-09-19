import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_app/API/user_profile.dart';
import 'package:local_app/screens/home/profile/components/service/UserProfileService.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({super.key});

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  List<UserProfile> dataProfile = [];
  UserProfileService userProfileService = UserProfileService();

  getProfile() async {
    dataProfile = await userProfileService.getProfile();
    log('data' + dataProfile.toString());
    setState(() {});
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemBuilder: (context, index) {
            log("ITEM : ${dataProfile[index].id}");
            return Container(
              child: Text(dataProfile[index].username),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: dataProfile.length,
        ));
  }
}
