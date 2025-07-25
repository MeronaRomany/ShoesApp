import 'package:flutter/material.dart';
import 'package:shoes_app/resources/core/on_borading_model.dart';
import 'package:shoes_app/widgets/custom_bottom_navigation_bar.dart';

import '../resources/core/on_boarding_controller.dart';
import '../widgets/custom_on_borading.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  final OnBoardingController controller= OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
          text: "Get Started",
          controller: controller.controllerNavagationBar,
          itemCount: controller.onBoardindList.length),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topRight,
                child: Image.asset("assets/images/Ellipse 906.png",width: 200,height: 150,)),
            Expanded(
              child: PageView.builder(
                controller: controller.controllerNavagationBar,
                  itemBuilder:(context,index)=>
                      CustomOnBoarding(image: controller.onBoardindList[index].image, title2:controller.onBoardindList[index].title2, title1: controller.onBoardindList[index].title1),
                itemCount:controller.onBoardindList.length,
              ),
            ),

          ],
        ),
      )
    );
  }
}


