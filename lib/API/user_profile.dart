// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

List<UserProfile> userProfileFromJson(String str) => List<UserProfile>.from(json.decode(str).map((x) => UserProfile.fromJson(x)));

String userProfileToJson(List<UserProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfile {
    String username;
    String email;
    String gender;
    DateTime birthday;
    String address;
    String id;

    UserProfile({
        required this.username,
        required this.email,
        required this.gender,
        required this.birthday,
        required this.address,
        required this.id,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        username: json["username"],
        email: json["email"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        address: json["address"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "gender": gender,
        "birthday": birthday.toIso8601String(),
        "address": address,
        "id": id,
    };
}
