import 'dart:convert';

AccountInfoVo accountInfoVoFromJson(String str) => AccountInfoVo.fromJson(json.decode(str));

String accountInfoVoToJson(AccountInfoVo data) => json.encode(data.toJson());

class AccountInfoVo {
  AccountInfoVo({
    required this.status,
    required this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required this.details,
  });

  String? status;
  String? responseCode;
  String? description;
  bool? isRequieredUpdate;
  bool? isforceUpdate;
  Details? details;

  factory AccountInfoVo.fromJson(Map<String, dynamic> json) => AccountInfoVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details:json['details']!=null ? Details?.fromJson(json["details"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": details!.toJson(),
  };
}

class Details {
  Details({
      this.tenantId,
     this.name,
     this.status,
      this.mail,
     this.uid,
     this.profileId,
     this.firstname,
     this.lastname,
     this.phone1,
     this.phone2,
     this.phone3,
     this.creationDate,
     this.modifiedDate,
     this.building,
     this.unit,
  });

  String? tenantId;
  String? name;
  String? status;
  String? mail;
  String? uid;
  String? profileId;
  String? firstname;
  String? lastname;
  String? phone1;
  String? phone2;
  String? phone3;
  String? creationDate;
  String? modifiedDate;
  String? building;
  String? unit;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    tenantId: json["tenant_id"] ?? json[''],
    name: json["name"],
    status: json["status"],
    mail: json["mail"],
    uid: json["uid"],
    profileId: json["profile_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone1: json["phone_1"],
    phone2: json["phone_2"],
    phone3: json["phone_3"],
    creationDate: json["creation_date"],
    modifiedDate: json["modified_date"],
    building: json["building"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "tenant_id": tenantId,
    "name": name,
    "status": status,
    "mail": mail,
    "uid": uid,
    "profile_id": profileId,
    "firstname": firstname,
    "lastname": lastname,
    "phone_1": phone1,
    "phone_2": phone2,
    "phone_3": phone3,
    "creation_date": creationDate,
    "modified_date": modifiedDate,
    "building": building,
    "unit": unit,
  };
}
