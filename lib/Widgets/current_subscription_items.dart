import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrentSubscriptionItems extends StatelessWidget {
  String currentPlan;
  int startDate, endDate;

  CurrentSubscriptionItems(this.startDate, this.endDate, this.currentPlan);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 59,
            child: Text(
              '$startDate',
              style: TextStyle(color: Colors.black, fontSize: 10,),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.grey,
          ),
          Container(
            width: 55,
            child: Text(
              '$endDate',
              style: TextStyle(color: Colors.black, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.grey,
          ),
          Container(
            width: 70,
            child: Text(
              currentPlan,
              style: TextStyle(color: Colors.black, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
