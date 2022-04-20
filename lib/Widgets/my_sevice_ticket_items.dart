import 'package:MJN/models/ticketListVO.dart';
import 'package:flutter/material.dart';
class MyServiceTicketItem extends StatelessWidget {
  TicketDetail ticketDetailVO;

  MyServiceTicketItem(this.ticketDetailVO);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 41,
            child: InkWell(
              onTap: (){},
              child: Text(
                ticketDetailVO.ticketId,
                style: TextStyle(color: Colors.black, fontSize: 8,decoration: TextDecoration.underline,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),

          Container(
            width: 50,
            child: Text(
              ticketDetailVO.creationDate,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 40,
            child: Text(
              ticketDetailVO.serviceRequest ?? '',
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 30,
            child: Text(
              'ticketDetailVO.serviceRequestOther',
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 34,
            child: Text(
              ticketDetailVO.status,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }
}
