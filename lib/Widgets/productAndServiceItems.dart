import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ProductAndServiceItems extends StatelessWidget {
  Offer offerImages;
  ProductAndServiceItems(this.offerImages);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(children: [
        Expanded(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 34),
                decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage(
                    BASE_URL + offerImages.image,
                  ) ,fit: BoxFit.fill),
                  border: Border.all(color: Color(0xffBC8F8F)),
                  borderRadius: BorderRadius.all(
                      Radius.circular(24.0) //                 <--- border radius here
                  ),
                ),
              ),
            ),

            Positioned(
              child:   Image(
                  image: AssetImage('assets/images/offer.png')),)

          ],),
        ),




      ],),
    );
  }
}
