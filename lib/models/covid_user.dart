import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'covid_user.g.dart';

@JsonSerializable()
class CovidUser {
  String omang;
  String name;
  String email;
  String phoneNumber;
  String physicalAddress;
  String? role;
  String userId;

  CovidUser({
    required this.omang,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.physicalAddress,
    required this.role,
    required this.userId,
  });

  factory CovidUser.fromDocument(DocumentSnapshot snapshot) {
    String userId = "";
    String name = "";
    String phoneNumber = "";
    String role = "";

    try {
      name = snapshot.get("name");
      userId = snapshot.get("userId");
      role = snapshot.get('role');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return CovidUser(
      omang: "",
      userId: userId,
      email: "",
      name: name,
      phoneNumber: "",
      physicalAddress: "",
      role: role,
    );
  }

  factory CovidUser.fromJson(Map<String, dynamic> json) =>
      _$CovidUserFromJson(json);
  Map<String, dynamic> toJson() => _$CovidUserToJson(this);
}
