import 'package:flutter/material.dart';

class NewAboutUsView extends StatefulWidget {
  @override
  _NewAboutUsViewState createState() => _NewAboutUsViewState();
}

class _NewAboutUsViewState extends State<NewAboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/about_us_bg.png'), fit: BoxFit.cover),
        ),
        child: Container(
            child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 55,bottom: 40),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff).withOpacity(0.7),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: _buildAboutUsParagraph(),
                            ),
                          ),

                          Positioned(child: Image(
                              width: double.infinity,
                              image: AssetImage('assets/images/about_us.png')))

                        ],),
                      ),
                    )

                  ],
                ),
          ),
      ),
    );
  }

  Widget _buildAboutUsParagraph(){
    return Container(
      margin: EdgeInsets.only(top: 40,bottom: 40),
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'FINALLY HERE...Brand new Fiber Internet at star City!',
            textAlign: TextAlign.left,
            style: TextStyle(color: Color(0xff188FC5),fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'We Have invested in the best equipment and network infrastructure for all ot you at Star City.',
            textAlign: TextAlign.left,
            style: TextStyle(),
          ),
          SizedBox(
            height: 30,
          ),

          RichText(
            text: TextSpan(
              text: 'What this means is,',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'NO MORE COOPER ADSL network anymore....', style: TextStyle(color: Color(0xff188FC5),)),

              ],
            ),
          ),



          SizedBox(
            height: 30,
          ),

          RichText(
            text: TextSpan(
              text: 'What that also mean is we have implemented a ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: '"Best in Class Technology" for our ALL NEW FIBER NETWORK.', style: TextStyle(color: Color(0xff188FC5),)),

              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),



          RichText(
            text: TextSpan(
              text: 'We have also lowered our price by over ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: '60% from our current price in order to serve you better.', style: TextStyle(color: Color(0xff188FC5),)),

              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),

          RichText(
            text: TextSpan(
              text: 'Our starting fiber package is ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: '10Mbps for ONLY 50,000mmk pre month with one time installation charges of 100,000mmk.', style: TextStyle(color: Color(0xff188FC5),)),

              ],
            ),
          ),



          SizedBox(
            height: 30,
          ),

          Text(
            'Best of all,we stand behind our new Fiber.',
            textAlign: TextAlign.left,
            style: TextStyle(color: Color(0xff188FC5)),
          ),

          SizedBox(
            height: 30,
          ),

          Text(
            'If you are unhappy for whatever reason for the first 30 days,we offer a 100% full money back guarantee.',
            textAlign: TextAlign.left,
            style: TextStyle(),
          ),



          SizedBox(
            height: 30,
          ),

          Text(
            'Come in to our SHOWROOM to LEARN MORE and CREATE YOUR ACCOUNT Today.',
            textAlign: TextAlign.left,
            style: TextStyle(),
          ),



        ],
      ),
    );
  }
}
