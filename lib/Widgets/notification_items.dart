import 'package:MJN/models/notificationModelVO.dart';
import 'package:flutter/material.dart';

class NotificationItems extends StatelessWidget {

 String notiText;
 NotificationItems(this.notiText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         width: MediaQuery.of(context).size.width,
           margin: EdgeInsets.only(left: 14,right: 14),
           decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(
                8.0) //                 <--- border radius here
            ),
           ), child : Padding(
             padding: const EdgeInsets.all(18.0),
             child: Text(
               notiText,
               textAlign: TextAlign.center,
               style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                   color: Colors.white,),
              ),
           ),
      ),
    );
  }
}
