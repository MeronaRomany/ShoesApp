import 'package:flutter/material.dart';

class CustomListViewSizeShoes extends StatelessWidget {
  const CustomListViewSizeShoes({super.key,
    required this.backgroundContainer,
    required this.textColor,
  required this.textSize});
 final Color backgroundContainer;
 final Color textColor;
 final String textSize;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 50,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: backgroundContainer,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Center(
        child: Text(textSize,style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,
            color: textColor)),
      ),
    );
  }
}
