import 'package:flutter/cupertino.dart';
import 'package:shoes_app/screens/home_page.dart';
import 'package:shoes_app/screens/on_borading.dart';

class RouteMangement{
 static Map<String,WidgetBuilder> route={

    RouteName.OnBoarding:(context)=>OnBoardingScreen(),
    RouteName.homePage:(context)=>HomePage(),


  };



}
class RouteName{
  static String OnBoarding="OnBoarding";
  static String homePage="HomePage";
  //static String splashPage="SplashPage";
}