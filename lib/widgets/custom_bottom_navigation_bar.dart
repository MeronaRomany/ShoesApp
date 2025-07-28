import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key,required this.text,required this.controller,required this.itemCount,required this.outputStream,required this.onTap});
  final String text;
  final PageController controller;
  final int itemCount;
  final Stream<int> outputStream;
 final GestureTapCallback onTap;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          StreamBuilder(
            stream: widget.outputStream,
            builder:(context,snapshot) =>SmoothPageIndicator(
                controller: widget.controller,  // PageController
                count:  widget.itemCount,
                effect:  WormEffect(),  // your preferred effect
                onDotClicked: (index){
                 index=snapshot.data!;
                }
            ),
          ),
         Spacer(),
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.all(2),

              height:80,
              width: 120,
              decoration: BoxDecoration(
                color: Color(0xff5B9EE1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          )
        ],
      ),
    );
  }
}
