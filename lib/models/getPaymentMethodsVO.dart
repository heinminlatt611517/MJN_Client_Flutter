import 'dart:convert';

GetPaymentMethodsVo getPaymentMethodsVoFromJson(String str) => GetPaymentMethodsVo.fromJson(json.decode(str));

String getPaymentMethodsVoToJson(GetPaymentMethodsVo data) => json.encode(data.toJson());

class GetPaymentMethodsVo {
  GetPaymentMethodsVo({
  required  this.status,
   required  this.responseCode,
   required this.description,
   required this.isRequieredUpdate,
   required this.isforceUpdate,
   required this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  Details details;

  factory GetPaymentMethodsVo.fromJson(Map<String, dynamic> json) => GetPaymentMethodsVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": details.toJson(),
  };
}

class Details {
  Details({
   required this.paymentLink,
  });

  String paymentLink;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    paymentLink:json["payment_link"] != null ? json["payment_link"] : null,
  );

  Map<String, dynamic> toJson() => {
    "payment_link": paymentLink,
  };
}
