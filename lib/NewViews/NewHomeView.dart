import 'package:MJN/Widgets/promotion_items.dart';
import 'package:MJN/controllers/homeController.dart';
import 'package:MJN/models/promotionAndofferVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewHomeView extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _NewHomeViewState createState() => _NewHomeViewState();
}

class _NewHomeViewState extends State<NewHomeView> {
  final HomeController homeController = Get.put(HomeController());
  final controller = CarouselController();
  int changePageIndex = 0;

  final loginDataStorage = GetStorage();
  double itemHeight = 0;
  double itemWidth = 0;
  int activeIndex = 0;

  @override
  void initState() {
    changePageIndex = 0;

    Future.delayed(Duration.zero,
        () => homeController.fetchPromotionAndOfferData(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    itemHeight = (size.height - kToolbarHeight - 24) / 4;
    itemWidth = size.width / 2;

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
                        () =>
                            homeController.fetchPromotionAndOfferData(context));
                  })
            ],
          ));
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.blueAccent,
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 200,
                    child: _buildCustomCarousalSlider()),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      buildIndicator(),
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
                      GridView(
                          shrinkWrap: true,
                          physics: new NeverScrollableScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(10),
                          children: homeController
                              .promotionAndOfferVo!.details.offer
                              .map((imgData) => PackageAndServiceItems(imgData))
                              .toList(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: (0.9 / .9),
                          )),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
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

  Widget _buildCustomCarousalSlider() {
    return Stack(
      children: [
        ClipRRect(
          child: CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                  initialPage: 0,
                  height: 200,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index)),
              itemCount:
                  homeController.promotionAndOfferVo!.details.promotion.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = homeController
                    .promotionAndOfferVo!.details.promotion[index].image;
                return _buildImage(urlImage, index);
              }),
        ),
        Positioned(
            child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: previous,
                child: Image(
                    image: AssetImage('assets/images/left_arrow_icon.png')),
              ),
              InkWell(
                onTap: next,
                child: Image(
                    image: AssetImage('assets/images/right_arrow_icon.png')),
              ),
            ],
          ),
        ))
      ],
    );
  }

  void next() => controller.nextPage();

  void previous() => controller.previousPage();

  Widget _buildImage(String imageUrl, int index) => Container(
          child: Image.network(
        BASE_URL + imageUrl,
        fit: BoxFit.fill,
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: homeController.promotionAndOfferVo!.details.promotion.length,
        effect: SlideEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.white,
            dotColor: Colors.grey.withOpacity(0.5)),
      );
}
