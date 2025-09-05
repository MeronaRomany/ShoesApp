import 'package:flutter/material.dart';

class CustumItemComponanetListview extends StatelessWidget {
  const CustumItemComponanetListview({
    super.key,required this.isAnimate,
    required this.onTap,
  required this.image,
  required this.title});
 final bool isAnimate;
 final GestureTapCallback onTap;
 final String? image;
 final String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Color(0xff5B9EE1),
          borderRadius: BorderRadius.circular(18),
        ),
        curve: Curves.easeIn,
        duration:Duration(milliseconds: 5) ,
        margin: EdgeInsets.all(5),
        padding:  EdgeInsets.all(5),
        width: isAnimate?100:60,
        child: isAnimate?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(image!),

            ),
            Text(title!),

          ],
        ):CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(image!),
        )
      ),
    );
  }
}
