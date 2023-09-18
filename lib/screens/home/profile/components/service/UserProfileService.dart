import 'dart:convert';
import 'dart:developer';

import 'package:local_app/API/user_profile.dart';
import 'package:http/http.dart' as http;

class UserProfileService {
  final _baseUrl = 'https://6503cd5ac8869921ae242c7d.mockapi.io/userProfile/';

  Future getProfile() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        log(response.body);
        Iterable it = jsonDecode(response.body);
        List<UserProfile> profile = it.map((e) => UserProfile.fromJson(e)).toList();
        log("LIST PROFILE $profile");
        return profile;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

  // static final String _baseUrl = 'https://api.api-ninjas.com/v1/randomuser';

  // Future getDataFake() async{
  //   Uri urlApi = Uri.parse(_baseUrl);

  //   final response = await http.get(urlApi);
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return dataFakeFromJson(response.body.toString());
  //   } else {
  //     throw Exception('failed to load');
  //   }
  // }