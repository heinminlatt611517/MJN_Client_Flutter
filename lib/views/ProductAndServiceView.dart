import 'package:flutter/material.dart';

class ProductAndServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Products And Services',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
