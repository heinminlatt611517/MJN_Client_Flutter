import 'package:flutter/material.dart';
class PackageAndServiceItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.all(
            Radius.circular(24.0) //                 <--- border radius here
        ),
      ),
    );
  }
}
