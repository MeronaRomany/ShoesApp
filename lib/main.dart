import 'package:flutter/material.dart';
import 'package:shoes_app/resources/core/route_management.dart';
import 'package:shoes_app/screens/home_page.dart';
import 'package:shoes_app/screens/on_borading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute:RouteName.OnBoarding ,
      routes:RouteMangement.route ,

    );
  }
}

