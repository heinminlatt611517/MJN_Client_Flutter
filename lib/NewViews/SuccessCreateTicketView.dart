import 'package:MJN/NewViews/NewServiceComplainView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';

class SuccessCreateTicketView extends StatefulWidget {
  @override
  _SuccessCreateTicketViewState createState() => _SuccessCreateTicketViewState();
}

class _SuccessCreateTicketViewState extends State<SuccessCreateTicketView> {

  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabScreens.serviceComplainIndex == 0 ? NewServiceComplainView() :Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
        child: Column(
          children: [

          Image(image: AssetImage('assets/images/thank_icon.png')),

          SizedBox(height: 20,),

          Text('The service ticket was submitted successfully.',style: TextStyle(color:Color(0xffe9e9e9) ),),

          SizedBox(height: 60,),

          Container(
            width: 150,
            child: RaisedButton(onPressed: (){
                setState(() {
                  TabScreens
                      .serviceComplainIndex = 0;
                });
            },
              child: Text('Back'),
              textColor: Colors.black,
              color: Color(0xffffcc35),
            ),
          )
        ],),
      ),
    );
  }
}
