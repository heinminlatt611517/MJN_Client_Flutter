import 'package:MJN/views/AboutUsView.dart';
import 'package:MJN/views/ProductAndServiceView.dart';
import 'package:MJN/views/TermAndConditionView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData icon,Function tabsHandler){
    return
      ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),),
        // onTap: tabsHandler,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          Container(
            height: 145,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Color(0xFFEEEEEE),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12,top: 25),
              child: Text(
                'Welcome To Mojoenet',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile('Products and Services', Icons.arrow_right,
                  (){
            Get.to(ProductAndServiceView());
          }),

          buildListTile('About us', Icons.arrow_right,
                  (){
                    Get.to(AboutUsView());
          }),
          buildListTile('Terms & Conditions', Icons.arrow_right,
                  (){
                    Get.to(TermAndConditionView());
              }),

          buildListTile('Contact us', Icons.arrow_right,
                  (){
              }),


        ],
      ),
    );
  }
}
