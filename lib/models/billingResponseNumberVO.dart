import 'dart:convert';

BillingResponseNumberVo billingResponseNumberVoFromJson(String str) =>
    BillingResponseNumberVo.fromJson(json.decode(str));

String billingResponseNumberVoToJson(BillingResponseNumberVo data) =>
    json.encode(data.toJson());

class BillingResponseNumberVo {
  BillingResponseNumberVo({
   required this.status,
   required this.responseCode,
   required this.description,
   required this.isRequieredUpdate,
   required this.isforceUpdate,
   required this.billingResponsiveNo,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  String? billingResponsiveNo;

  factory BillingResponseNumberVo.fromJson(Map<String, dynamic> json) =>
      BillingResponseNumberVo(
        status: json["status"],
        responseCode: json["response_code"],
        description: json["description"],
        isRequieredUpdate: json["is_requiered_update"],
        isforceUpdate: json["isforce_update"],
        billingResponsiveNo: json["billing_responsive_no"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response_code": responseCode,
        "description": description,
        "is_requiered_update": isRequieredUpdate,
        "isforce_update": isforceUpdate,
        "billing_responsive_no": billingResponsiveNo,
      };
}
