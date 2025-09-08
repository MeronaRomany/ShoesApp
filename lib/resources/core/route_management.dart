import 'package:flutter/cupertino.dart';
import 'package:shoes_app/screens/first_page.dart';
import 'package:shoes_app/screens/on_borading.dart';

import '../../screens/cart_products.dart';
import '../../screens/details_product.dart';
import '../../screens/home_page.dart';

class RouteMangement{
 static Map<String,WidgetBuilder> route={

    RouteName.OnBoarding:(context)=>OnBoardingScreen(),
    RouteName.firstPage:(context)=>FirstPage(),
    RouteName.DetailsProduct:(context)=>DetailsProduct(),
    RouteName.CartProducts:(context)=>CartProducts(),
   RouteName.homePage:(context)=>HomePage()

 };



}
class RouteName{
  static String OnBoarding="OnBoarding";
  static String firstPage="firstPage";
  static String homePage="homePage";
  static String DetailsProduct="DetailsProduct";
  static String CartProducts="CartProducts";
}