// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    this.title,
    this.description,
    this.category,
    this.timestamp,
    this.priority,
    this.userId,
    this.isCompleted,
    this.id,
  });

  String? title;
  String? description;
  String? category;
  String? timestamp;
  String? priority;
  String? userId;
  String? isCompleted;
  String? id;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        title: json["title"],
        description: json["description"],
        category: json["category"],
        timestamp: json["timestamp"],
        priority: json["priority"],
        userId: json["user_id"],
        isCompleted: json["isCompleted"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "category": category,
        "timestamp": timestamp,
        "priority": priority,
        "user_id": userId,
        "isCompleted": isCompleted,
        "id": id,
      };
}
