// To parse this JSON data, do
//
//     final invoiceVo = invoiceVoFromJson(jsonString);

import 'dart:convert';

InvoiceVo invoiceVoFromJson(String str) => InvoiceVo.fromJson(json.decode(str));

String invoiceVoToJson(InvoiceVo data) => json.encode(data.toJson());

class InvoiceVo {
  InvoiceVo({
    required  this.status,
    required this.responseCode,
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

  factory InvoiceVo.fromJson(Map<String, dynamic> json) => InvoiceVo(
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
   required this.name,
    required this.firstname,
    required this.lastname,
    required this.building,
    required this.unit,
    required this.startDate,
    required this.endDate,
    required this.invoiceId,
    required this.creationDate,
    required this.tax,
    required this.equipmentTotal,
    required this.otherTotal,
    required this.activationFee,
    required this.reactivationFee,
    required this.discount_total,
    required this.fiber_rental,
    required this.ipvpn,
    required this.amount,
    required this.totalDue,
    required this.transactionDate,
    required this.taxAmount,
  });

  String name;
  String firstname;
  String lastname;
  String building;
  String unit;
  String startDate;
  String endDate;
  String invoiceId;
  String creationDate;
  String tax;
  String equipmentTotal;
  String otherTotal;
  String activationFee;
  String reactivationFee;
  String discount_total;
  String amount;
  String fiber_rental;
  String ipvpn;
  String totalDue;
  String transactionDate;
  String taxAmount;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    name: json["name"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    building: json["building"],
    unit: json["unit"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    invoiceId: json["invoice_id"],
    creationDate: json["creation_date"],
    tax: json["tax"],
    equipmentTotal: json["equipment_total"],
    otherTotal: json["other_total"],
    activationFee: json["activation_fee"],
    reactivationFee: json["reactivation_fee"],
    discount_total: json["discount_total"],
    amount: json["amount"],
    ipvpn: json["ipvpn"],
    fiber_rental: json["fiber_rental"],
    totalDue: json["total_due"],
    transactionDate: json["transaction_date"],
    taxAmount: json["tax_amount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "firstname": firstname,
    "lastname": lastname,
    "building": building,
    "unit": unit,
    "start_date": startDate,
    "end_date": endDate,
    "invoice_id": invoiceId,
    "creation_date": creationDate,
    "tax": tax,
    "equipment_total": equipmentTotal,
    "other_total": otherTotal,
    "activation_fee": activationFee,
    "reactivation_fee": reactivationFee,
    "amount": amount,
    "total_due": totalDue,
    "transaction_date": transactionDate,
    "tax_amount": taxAmount,
  };
}
