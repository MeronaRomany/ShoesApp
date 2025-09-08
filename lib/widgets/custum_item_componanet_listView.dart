import 'package:flutter/material.dart';

class CustumItemComponanetListview extends StatelessWidget {
  const CustumItemComponanetListview({
    super.key,
    required this.isAnimate,
    required this.onTap,
    required this.image,
    required this.title,
  });
  final bool isAnimate;
  final GestureTapCallback onTap;
  final String? image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: Color(0xff5B9EE1),
            borderRadius: BorderRadius.circular(18),
          ),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: isAnimate ? 120 : 70,
          child:
              isAnimate
                  ? Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(image!),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ],
                  )
                  : CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(image!),
                  ),
        ),
      ),
    );
  }
}
