// To parse this JSON data, do
//
//     final promotionAndOfferVo = promotionAndOfferVoFromJson(jsonString);

import 'dart:convert';

PromotionAndOfferVo promotionAndOfferVoFromJson(String str) => PromotionAndOfferVo.fromJson(json.decode(str));

String promotionAndOfferVoToJson(PromotionAndOfferVo data) => json.encode(data.toJson());

class PromotionAndOfferVo {
  PromotionAndOfferVo({
   required this.status,
   required this.responseCode,
    required this.description,
    required this.isRequieredUpdate,
    required this.isforceUpdate,
    required this.details,
   required this.loginManual,
   required this.serviceTicketManual,
   required this.onlinePaymentManual,
  });

  String status;
  String responseCode;
  String description;
  bool isRequieredUpdate;
  bool isforceUpdate;
  String loginManual;
  String serviceTicketManual;
  String onlinePaymentManual;
  Details details;

  factory PromotionAndOfferVo.fromJson(Map<String, dynamic> json) => PromotionAndOfferVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    isRequieredUpdate: json["is_requiered_update"],
    isforceUpdate: json["isforce_update"],
    details: Details.fromJson(json["details"]),
    loginManual: json["login_manual"],
    serviceTicketManual: json["service_ticket_manual"],
    onlinePaymentManual: json["online_payment_manual"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "is_requiered_update": isRequieredUpdate,
    "isforce_update": isforceUpdate,
    "details": details.toJson(),
    "login_manual": loginManual,
    "service_ticket_manual": serviceTicketManual,
    "online_payment_manual": onlinePaymentManual,
  };
}

class Details {
  Details({
    required this.promotion,
    required this.offer,
  });

  List<Offer> promotion;
  List<Offer> offer;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    promotion: List<Offer>.from(json["promotion"].map((x) => Offer.fromJson(x))),
    offer: List<Offer>.from(json["offer"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "promotion": List<dynamic>.from(promotion.map((x) => x.toJson())),
    "offer": List<dynamic>.from(offer.map((x) => x.toJson())),
  };
}

class Offer {
  Offer({
    required  this.slideId,
    required this.name,
    required this.type,
    required this.image,
    required this.imageMm,
    required this.link,
    required this.backgroundColor,
    required this.title,
    required this.titleMm,
    required this.titleTxtColor,
    required this.description,
    required this.descriptionMm,
    required this.descriptionTxtColor,
    required this.status,
    required this.createdDate,
    required this.modifiedDate,
  });

  String slideId;
  String name;
  String type;
  String image;
  String imageMm;
  String link;
  String backgroundColor;
  String title;
  String titleMm;
  String titleTxtColor;
  String description;
  String descriptionMm;
  String descriptionTxtColor;
  String status;
  String createdDate;
  String modifiedDate;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    slideId: json["slide_id"],
    name: json["name"],
    type: json["type"],
    image: json["image"],
    imageMm: json["image_mm"],
    link: json["link"],
    backgroundColor: json["background_color"],
    title: json["title"],
    titleMm: json["title_mm"],
    titleTxtColor: json["title_txt_color"],
    description: json["description"],
    descriptionMm: json["description_mm"],
    descriptionTxtColor: json["description_txt_color"],
    status: json["status"],
    createdDate: json["created_date"],
    modifiedDate: json["modified_date"],
  );

  Map<String, dynamic> toJson() => {
    "slide_id": slideId,
    "name": name,
    "type": type,
    "image": image,
    "image_mm": imageMm,
    "link": link,
    "background_color": backgroundColor,
    "title": title,
    "title_mm": titleMm,
    "title_txt_color": titleTxtColor,
    "description": description,
    "description_mm": descriptionMm,
    "description_txt_color": descriptionTxtColor,
    "status": status,
    "created_date": createdDate,
    "modified_date": modifiedDate,
  };
}
