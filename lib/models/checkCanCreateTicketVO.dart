import 'dart:convert';

CheckCanCreateTicketVo checkCanCreateTicketVoFromJson(String str) => CheckCanCreateTicketVo.fromJson(json.decode(str));

String checkCanCreateTicketVoToJson(CheckCanCreateTicketVo data) => json.encode(data.toJson());

class CheckCanCreateTicketVo {
  CheckCanCreateTicketVo({
   required this.status,
   required this.responseCode,
   required this.description,
   required this.canCreate,
  });

  String status;
  String responseCode;
  String description;
  bool canCreate;

  factory CheckCanCreateTicketVo.fromJson(Map<String, dynamic> json) => CheckCanCreateTicketVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    canCreate: json["canCreate"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "canCreate": canCreate,
  };
}