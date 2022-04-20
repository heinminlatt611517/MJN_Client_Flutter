import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('About Us',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
