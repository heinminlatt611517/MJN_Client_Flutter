import 'dart:convert';

InvoiceListVo invoiceListVoFromJson(String str) => InvoiceListVo.fromJson(json.decode(str));

String invoiceListVoToJson(InvoiceListVo data) => json.encode(data.toJson());

class InvoiceListVo {
  InvoiceListVo({
    required  this.status,
    required this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required  this.details,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  List<Detail>? details;

  factory InvoiceListVo.fromJson(Map<String, dynamic> json) => InvoiceListVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: List<Detail>.from(json["details"]?.map((x) => Detail.fromJson(x)) ?? []),
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

class Detail {
  Detail({
    required  this.invoiceId,
    required  this.paymentTotal,
    required this.currencyType,
    required this.startDate,
    required this.endDate,
    required this.creationDate,
    required this.modifiedDate,
    required this.transactionId,
    required  this.paidDate,
    required  this.isCreditNote,
    this.creditWith,
    this.creditAmount,
    this.creditCurrency,
    this.creditDate,
    required  this.paymentStatus,
  });

  String invoiceId;
  String paymentTotal;
  String currencyType;
  String startDate;
  String endDate;
  String creationDate;
  String modifiedDate;
  dynamic transactionId;
  String paidDate;
  String isCreditNote;
  dynamic creditWith;
  dynamic creditAmount;
  dynamic creditCurrency;
  dynamic creditDate;
  String paymentStatus;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    invoiceId: json["invoice_id"],
    paymentTotal: json["payment_total"],
    currencyType: json["currency_type"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    creationDate: json["creation_date"],
    modifiedDate: json["modified_date"],
    transactionId: json["transaction_id"],
    paidDate: json["paid_date"],
    isCreditNote: json["isCreditNote"],
    creditWith: json["credit_with"],
    creditAmount: json["credit_amount"],
    creditCurrency: json["credit_currency"],
    creditDate: json["credit_date"],
    paymentStatus: json["payment_status"],
  );

  Map<String, dynamic> toJson() => {
    "invoice_id": invoiceId,
    "payment_total": paymentTotal,
    "currency_type": currencyType,
    "start_date": startDate,
    "end_date": endDate,
    "creation_date": creationDate,
    "modified_date": modifiedDate,
    "transaction_id": transactionId,
    "paid_date": paidDate,
    "isCreditNote": isCreditNote,
    "credit_with": creditWith,
    "credit_amount": creditAmount,
    "credit_currency": creditCurrency,
    "credit_date": creditDate,
    "payment_status": paymentStatus,
  };
}
