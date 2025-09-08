import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/cubit/cubit_brands_homePage.dart';
import 'package:shoes_app/cubit/cubit_isSeeAllProduct.dart';
import 'package:shoes_app/resources/core/route_management.dart';
import 'package:shoes_app/screens/first_page.dart';
import 'package:shoes_app/screens/on_borading.dart';

import 'cubit/cubit_cart_products.dart';
import 'cubit/cubit_prodect.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers:[
        BlocProvider(
        create: (context)=>ProductsCubit()..getProduct(),
        ),
          BlocProvider(
            create: (context)=>CubitCartProduct(),
          ),
          BlocProvider(
            create: (context)=>BrandsCubit(),
          ),
          BlocProvider(
            create: (context)=>SeeAllProduct(),
          ),
        ],
        child: const MyApp()),

      );
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

