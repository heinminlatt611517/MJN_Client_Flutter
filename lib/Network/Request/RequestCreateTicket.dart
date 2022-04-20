class RequestCreateTicket {
  String name;
  String building;
  String unit;
  String email;
  String phone;
  String service_request;
  String topic;
  String topic_other;
  String message;
  String ssid;
  String tenant_id;
  String uid;
  String app_version;

  RequestCreateTicket(
      this.name,
      this.building,
      this.unit,
      this.email,
      this.phone,
      this.service_request,
      this.topic,
      this.topic_other,
      this.message,
      this.ssid,
      this.tenant_id,
      this.uid,
      this.app_version);

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['building'] = this.building;
    data['unit'] = this.unit;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['service_request'] = this.service_request;
    data['topic'] = this.topic;
    data['topic_other'] = this.topic_other;
    data['message'] = this.message;
    data['ssid'] = this.ssid;
    data['tenant_id'] = this.tenant_id;
    data['uid'] = this.uid;
    data['app_version'] = this.app_version;


    return data;
  }
}
