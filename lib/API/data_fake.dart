// To parse this JSON data, do
//
//     final dataFake = dataFakeFromJson(jsonString);

import 'dart:convert';

List<DataFake> dataFakeFromJson(String str) => List<DataFake>.from(json.decode(str).map((x) => DataFake.fromJson(x)));

String dataFakeToJson(List<DataFake> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataFake {
    int userId;
    int id;
    String title;
    String body;

    DataFake({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory DataFake.fromJson(Map<String, dynamic> json) => DataFake(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
