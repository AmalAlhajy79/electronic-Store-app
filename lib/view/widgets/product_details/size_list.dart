import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SizeList extends StatefulWidget {
  SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {

  final List<String> sizeList=['S','M','L','XL','XXL'];
  var currentSelected=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:sizeList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
               setState(() {
                 currentSelected=index;
               });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode?  currentSelected==index ? minpink.withOpacity(0.5):minblack.withOpacity(0.5) :
                                           currentSelected==index ? minColor.withOpacity(0.5):minWhite.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: mingrey.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(
                    color: Get.isDarkMode? currentSelected==index? minWhite:minWhite: currentSelected==index? minblack:minblack,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
          },
          separatorBuilder:  (context,index)=>
            SizedBox(
              width: 10,
            ),
      ),
    );
  }
}
