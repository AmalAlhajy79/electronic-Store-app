import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/product_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  ImageSliders({super.key, required this.imageUrl});

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {

final  cartController=Get.find<CartController>();

  final List<Color> colorSelected = [
    minpink,
    minWhite,
    minColor,
    minRedDark,
    mingrey,
    minblue,
    minyellow,
    minColor
  ];
  int currentPage = 0;
  int currentColorIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  )),
            );
          },
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              //يعني بتتحرك لحالها بدون ما حدا يحركها
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? minpink : minColor,
                  dotColor: minblack),
            )),
        Positioned(
          right: 30,
          bottom: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: minblack.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      currentColorIndex=index;
                    });
                  },
                  child: ColorPicker(
                      outerBorder: currentColorIndex==index,
                      color: colorSelected[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 3,
                );
              },
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 25,right: 25,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode?minpink.withOpacity(0.8)  : minColor.withOpacity(0.8),
                    shape:BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,color: Get.isDarkMode?minblack:minWhite,size: 23,),
                  ),
                ),
              ),
             Obx(() =>  Badge(
               position: BadgePosition.topEnd(top: -10, end: -10),
               animationDuration: Duration(milliseconds: 300),
               animationType: BadgeAnimationType.slide,
               badgeContent: Text(
                 cartController.quantity().toString() ,
                 style: TextStyle(color: Colors.white),
               ),
               child: InkWell(
                 onTap: (){
                   Get.toNamed('/cartScreen');
                 },
                 child: Container(
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     color: Get.isDarkMode?minpink.withOpacity(0.8)  : minColor.withOpacity(0.8),
                     shape:BoxShape.circle,
                   ),
                   child: Icon(Icons.shopping_cart,color: Get.isDarkMode?minblack:minWhite,size: 23,),
                 ),
               ),
             ),
             ),
            ],
          ),
        )
      ],
    );
  }
}
