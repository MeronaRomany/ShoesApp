import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key,required this.text,required this.controller,required this.itemCount});
  final String text;
  final PageController controller;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          SmoothPageIndicator(
              controller: controller,  // PageController
              count:  itemCount,
              effect:  WormEffect(),  // your preferred effect
              onDotClicked: (index){
              }
          ),
         Spacer(),
          Container(
            padding: EdgeInsets.all(2),

            height:80,
            width: 120,
            decoration: BoxDecoration(
              color: Color(0xff5B9EE1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 18),),
          )
        ],
      ),
    );
  }
}
