import 'package:flutter/cupertino.dart';
import 'package:shoes_app/screens/home_page.dart';
import 'package:shoes_app/screens/on_borading.dart';

import '../../screens/cart_products.dart';
import '../../screens/details_product.dart';

class RouteMangement{
 static Map<String,WidgetBuilder> route={

    RouteName.OnBoarding:(context)=>OnBoardingScreen(),
    RouteName.homePage:(context)=>HomePage(),
    RouteName.DetailsProduct:(context)=>DetailsProduct(),
    RouteName.CartProducts:(context)=>CartProducts(),

 };



}
class RouteName{
  static String OnBoarding="OnBoarding";
  static String homePage="HomePage";
  static String DetailsProduct="DetailsProduct";
  static String CartProducts="CartProducts";
}