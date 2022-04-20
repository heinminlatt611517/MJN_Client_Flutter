import 'package:flutter/material.dart';

class TermAndConditionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Terms And Conditions',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
