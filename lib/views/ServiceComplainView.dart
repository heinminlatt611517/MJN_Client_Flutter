import 'package:MJN/views/CreateServiceTicketView.dart';
import 'package:MJN/views/MyServiceTicketView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ServiceComplainView extends StatefulWidget {
  static const routeName = '/service_complain';

  @override
  _ServiceComplainViewState createState() => _ServiceComplainViewState();
}

class _ServiceComplainViewState extends State<ServiceComplainView> {
  int changePageIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? CreateServiceTicketView()
        : changePageIndex == 2
            ? MyServiceTicketView()
            : Scaffold(
                body: Column(
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
                          "Service Complain",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(14)),
                          color: Colors.blue,
                          depth: 8,
//                lightSource: LightSource.topLeft,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      color: Colors.grey,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              changePageIndex = 1;
                            });
                          },
                          child: Text('>>Create your service ticket')),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                changePageIndex = 2;
                              });
                            },
                            child: Text(
                              '>>View your service ticket',
                            ))),
                  ],
                ),
              );
  }
}
