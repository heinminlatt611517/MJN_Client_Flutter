import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 27),
              child: NeumorphicButton(
                onPressed: () {},
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                  color: Colors.blue,
                  depth: 8,
//                lightSource: LightSource.topLeft,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(50),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(
                        Radius.circular(24.0) //                 <--- border radius here
                    ),
                  ),
              child: Column(
                children: [
                  Text('24/7 Office Phone Number :',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      launch(('tel://01-4709977'));
                    },
                      child: Text('01-4709977',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Visit to us online',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.mail),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.blur_circular_sharp),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
