import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_app/screens/home/profile/components/form_profile_screen.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({super.key});

  @override
  State<BodyProfile> createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  ImagePicker picker = ImagePicker();
  File? image;

  Future getImage() async {
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: CircleAvatar(
                  backgroundImage:
                      image == null ? null : FileImage(File(image!.path)),
                  radius: 70,
                  backgroundColor: Colors.transparent,
                )),
                Center(
                  child: TextButton(
                    child: Text(
                      "edit photo",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () async {
                      await getImage();
                    },
                  ),
                ),
                FormProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
