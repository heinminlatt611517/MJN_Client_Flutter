import 'package:floor/floor.dart';

@Entity(tableName: 'notification')
class NotificationModelVO {
  @PrimaryKey(autoGenerate: true)
   int? id = 0;
  final String title;
  int? read;
  final String body;
  final String message;
  final String type_name;
  final String action_url;
  final String created;
  final String imageUrl;


  NotificationModelVO(this.id,this.title,this.body, this.message, this.type_name, this.action_url, this.created,this.imageUrl,{this.read=0});

  NotificationModelVO.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        title = json['title'],
        body = json['body'],
        message = json['message'],
        type_name = json['type_name'],
        action_url = json['action_url'],
        created = json['created'],
        imageUrl = json['image'],
        read = 0;


  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'message': message,
    'type_name': type_name,
    'action_url': action_url,
    'created': created,
    'image' : imageUrl
  };

  @override
  String toString() {
    return 'Dog{id: $id, title: $title, body: $body, message: $message, type_name: $type_name, action_url: $action_url}';
  }

}
