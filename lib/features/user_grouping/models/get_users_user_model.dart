// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetUsersUserModel {
  final String name;
  final String uid;

  GetUsersUserModel({required this.name, required this.uid});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
    };
  }

  factory GetUsersUserModel.fromMap(Map<String, dynamic> map) {
    return GetUsersUserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUsersUserModel.fromJson(String source) => GetUsersUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
