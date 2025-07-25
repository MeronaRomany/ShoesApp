import 'package:flutter/material.dart';

import 'custum_item_componanet_listView.dart';

class CustomListViewHomePage extends StatefulWidget {
  const CustomListViewHomePage({super.key});

  @override
  State<CustomListViewHomePage> createState() => _CustomListViewHomePageState();
}

class _CustomListViewHomePageState extends State<CustomListViewHomePage> {
  late bool isCheckAnimate=false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 400,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>
              CustumItemComponanetListview(
                isAnimate: isCheckAnimate,
                onTap:(){
                setState(() {
                  isCheckAnimate=!isCheckAnimate;
                });
              },),
        itemCount: 5,
      ),
    );
  }
}
