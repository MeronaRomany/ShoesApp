import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key,required this.text,required this.controller,required this.itemCount,required this.outputStream,required this.onTap});
  final String text;
  final PageController controller;
  final int itemCount;
  final Stream<int> outputStream;
 final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          StreamBuilder(
            stream: outputStream,
            builder:(context,snapshot){
              int currentIndex= snapshot.data??0;
              return SmoothPageIndicator(
                  controller: controller,  // PageController
                  count:  itemCount,
                  effect:  WormEffect(),  // your preferred effect
                  onDotClicked: (index){
                    controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
              );
            }

          ),
         Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
