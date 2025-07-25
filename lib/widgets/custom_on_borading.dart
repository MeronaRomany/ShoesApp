import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({super.key,required this.image,required this.title2,required this.title1});
 final String image;
  final String title1;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Positioned(
                  bottom: 100,
                  right: 8,
                  child: Image.asset("assets/images/NIKE.png",color: Colors.grey.withAlpha(20),)),
              SizedBox(
                height: 300,
                  child: Center(child: Image.asset(image,))),
              Image.asset("assets/images/Group 284.png"),
            ],
          ),
        ),

        Text(title2,
          textAlign:TextAlign.center,
         style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,

        ),),
        Text(title1,textAlign:TextAlign.center,style: TextStyle(
          fontSize: 20,
          color: Color(0xff707B81),

        ),)
      ],
    );
  }
}
