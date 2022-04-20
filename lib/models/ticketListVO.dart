import 'dart:convert';

TicketListVo ticketListVoFromJson(String str) => TicketListVo.fromJson(json.decode(str));

String ticketListVoToJson(TicketListVo data) => json.encode(data.toJson());

class TicketListVo {
  TicketListVo({
    required  this.status,
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
  List<TicketDetail>? details;

  factory TicketListVo.fromJson(Map<String, dynamic> json) =>
      TicketListVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
        details: List<TicketDetail>.from(json["details"]?.map((x) => TicketDetail.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,

    "details": List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class TicketDetail {
  TicketDetail({
    required  this.ticketId,
    required this.serviceRequest,
    required this.serviceRequestOther,
    required  this.status,
    required  this.message,
    required  this.resolvedTime,
    required this.creationDate,
  });

  String ticketId;
  String? serviceRequest;
  String? serviceRequestOther;
  String status;
  String message;
  String? resolvedTime;
  String creationDate;

  factory TicketDetail.fromJson(Map<String, dynamic> json) => TicketDetail(
    ticketId: json["ticket_id"],
    serviceRequest: json["service_request"],
    serviceRequestOther: json["service_request_other"],
    status: json["status"],
    message: json["message"],
    resolvedTime: json["resolved_time"],
    creationDate: json["creation_date"],
  );

  Map<String, dynamic> toJson() => {
    "ticket_id": ticketId,
    "service_request": serviceRequest,
    "service_request_other": serviceRequestOther,
    "status": status,
    "message": message,
    "resolved_time": resolvedTime,
    "creation_date": creationDate,
  };
}
