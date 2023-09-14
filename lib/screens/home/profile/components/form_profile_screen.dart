import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_app/API/data_fake.dart';
import 'package:local_app/screens/home/profile/components/service/DataFakeService.dart';

class FormProfile extends StatefulWidget {
  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  List<DataFake> data = [];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    data = await DataFakeService().getDataFake();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: getdata,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            log('data' + data[index].toString());
            return ListTile(
              title: Text(data[index].title),
            );
          },
        ),
      ),
    );
  }
}
