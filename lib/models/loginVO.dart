import 'dart:convert';

LoginVo loginVoFromJson(String str) => LoginVo.fromJson(json.decode(str));

String loginVoToJson(LoginVo data) => json.encode(data.toJson());

class LoginVo {
  LoginVo({
    required  this.status,
    required this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required  this.uid,
    required this.userName,
    required  this.phone,
    required this.token,
    required this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  String uid;
  String userName;
  String phone;
  String token;
  List<Detail> details;

  factory LoginVo.fromJson(Map<String, dynamic> json) => LoginVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    uid: json["uid"],
    userName: json["user_name"],
    phone: json["phone"],
    token: json["token"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "uid": uid,
    "user_name": userName,
    "phone": phone,
    "token": token,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required  this.tenantId,
    required this.building,
    required this.unit,
  });

  String tenantId;
  String building;
  String unit;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    tenantId: json["tenant_id"],
    building: json["building"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "tenant_id": tenantId,
    "building": building,
    "unit": unit,
  };
}
