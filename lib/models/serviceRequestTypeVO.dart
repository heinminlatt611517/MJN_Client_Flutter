// To parse this JSON data, do
//
//     final serviceRequestTypeVo = serviceRequestTypeVoFromJson(jsonString);

import 'dart:convert';

ServiceRequestTypeVo serviceRequestTypeVoFromJson(String str) => ServiceRequestTypeVo.fromJson(json.decode(str));

String serviceRequestTypeVoToJson(ServiceRequestTypeVo data) => json.encode(data.toJson());

class ServiceRequestTypeVo {
  ServiceRequestTypeVo({
    required this.status,
    required this.responseCode,
    required this.description,
    required this.details,
  });

  String status;
  String responseCode;
  String description;
  List<DetailType> details;

  factory ServiceRequestTypeVo.fromJson(Map<String, dynamic> json) => ServiceRequestTypeVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    details: List<DetailType>.from(json["details"].map((x) => DetailType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class DetailType {
  DetailType({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory DetailType.fromJson(Map<String, dynamic> json) => DetailType(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
