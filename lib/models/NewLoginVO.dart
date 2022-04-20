// To parse this JSON data, do
//
//     final newLoginVo = newLoginVoFromJson(jsonString);

import 'dart:convert';

NewLoginVo newLoginVoFromJson(String str) => NewLoginVo.fromJson(json.decode(str));

String newLoginVoToJson(NewLoginVo data) => json.encode(data.toJson());

class NewLoginVo {
  NewLoginVo({
    required this.status,
    required  this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required this.uid,
    required this.tenantId,
    required this.building,
    required this.unit,
    required this.phone,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
  });

  String? status;
  String? responseCode;
  String? description;
  bool? isRequieredUpdate;
  bool? isforceUpdate;
  String? uid;
  String? tenantId;
  String? building;
  String? unit;
  String? phone;
  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? token;

  factory NewLoginVo.fromJson(Map<String, dynamic> json) => NewLoginVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    uid: json["uid"],
    tenantId: json["tenant_id"],
    building: json["building"],
    unit: json["unit"],
    phone: json["phone"],
    userName: json["username"],
    email: json["email"],
    firstName: json["firstname"],
    lastName: json["lastname"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "uid": uid,
    "tenant_id": tenantId,
    "building": building,
    "unit": unit,
    "phone": phone,
    "username" : userName,
    "email" : email,
    "firstname" : firstName,
    "lastname" : lastName,
    "token": token,
  };
}
