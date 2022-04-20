import 'package:MJN/controllers/homeController.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class NewContactUsView extends StatefulWidget {
  @override
  _NewContactUsViewState createState() => _NewContactUsViewState();
}

class _NewContactUsViewState extends State<NewContactUsView> {
  final HomeController homeController = Get.put(HomeController());
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero,
        () => homeController.fetchPromotionAndOfferData(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff188FC5),
        body: Obx(() {
          if (homeController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (homeController.promotionAndOfferVo == null) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Network Error!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Connect to the internet and try again.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                    child: Text('Retry'),
                    textColor: Colors.white,
                    color: Colors.grey,
                    onPressed: () {
                      Future.delayed(
                          Duration.zero,
                          () => homeController
                              .fetchPromotionAndOfferData(context));
                    })
              ],
            ));
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 20, top: 25),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image(
                                image:
                                    AssetImage('assets/images/contact_us.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 20),
                            child: Column(
                              children: [
                                Text(
                                  '24/7 Hotline Number :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launch(('tel://01-4709977'));
                                      },
                                      child: Text(
                                        '01-4709977',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  'Visit to us online :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          openAppMail();
                                        },
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/email.png'))),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          onPressWidget(
                                              'https://mojoenet.com/webapp');
                                        },
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/web_icon.png'))),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          onPressWidget(
                                              'https://www.facebook.com/MojoeNet-1570238936409904/');
                                        },
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/fb_icon.png'))),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Color(0xff188FC5),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Offers",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: GridView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    primary: false,
                                    padding: const EdgeInsets.all(10),
                                    scrollDirection: Axis.vertical,
                                    children: homeController
                                        .promotionAndOfferVo!.details.offer
                                        .map((imgData) =>
                                            PackageAndServiceItems(imgData))
                                        .toList(),
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: (1 / .8),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }

  Widget PackageAndServiceItems(Offer offer) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                BASE_URL + offer.image,
              ),
              fit: BoxFit.fill),
          border: Border.all(color: Color(0xffBC8F8F)),
          borderRadius: BorderRadius.all(
              Radius.circular(24.0) //                 <--- border radius here
              ),
        ),
      ),
    );
  }

  void onPressWidget(String url) {
    launch((url));
  }

  void openAppMail() async {
    final Email email = Email(
      recipients: ['sales@mojoenet.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}
