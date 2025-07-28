import 'package:flutter/material.dart';
import 'package:shoes_app/resources/core/on_borading_model.dart';
import 'package:shoes_app/widgets/custom_bottom_navigation_bar.dart';

import '../resources/core/on_boarding_controller.dart';
import '../resources/core/route_management.dart';
import '../widgets/custom_on_borading.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  final OnBoardingController controller= OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        bottomNavigationBar: StreamBuilder<int>(
          stream: controller.outputStream,
          builder: (context, snapshot) {
            int currentIndex = snapshot.data ?? 0;

            return CustomBottomNavigationBar(
              onTap: () {
                controller.nextPageView();
               if(currentIndex==2){
                 Navigator.pushReplacementNamed(context,  RouteName.homePage);
               }
              },
              text: currentIndex == 0 ? "Get Started" : "Next",
              controller: controller.controllerNavagationBar,
              itemCount: controller.onBoardindList.length,
              outputStream: controller.outputStream!,
            );
          },
        ),

        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topRight,
                child: Image.asset("assets/images/Ellipse 906.png",width: 200,height: 150,)),
            Expanded(
              child: PageView.builder(
                controller: controller.controllerNavagationBar,
                  itemBuilder:(context,index){

                  return CustomOnBoarding(
                       image: controller.onBoardindList[index].image,
                       title2:controller.onBoardindList[index].title2,
                       title1: controller.onBoardindList[index].title1);},
                  itemCount:controller.onBoardindList.length,

              ),



              ),


          ],
        ),
      )
    );
  }
}


