import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/screens/first_page.dart';

import '../cubit/cubit_cart_products.dart';
import '../resources/core/route_management.dart';
import 'cart_products.dart';
import 'details_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages=[FirstPage(),DetailsProduct(),CartProducts()];
  int selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(45.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.CartProducts);
            context.read<CubitCartProduct>().products;
          },
          backgroundColor: Colors.blue,
          elevation: 12.0,       // هنا الضل القوي حوالين الدائرة
         // highlightElevation: 0, //
          splashColor: Colors.black,

          child: Icon(Icons.lock_outline, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[selectedIndex],

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
       height: 100,

        elevation: 0,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: SizedBox(
         // height: 170,
          child: BottomNavigationBar(
           // backgroundColor: Colors.red,
            type: BottomNavigationBarType.fixed,
             elevation: 0,
             showSelectedLabels: false,
            showUnselectedLabels: false,
             currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(icon: IconButton(onPressed: (){
                  _onItemTapped(0);
                }, icon: Icon(Icons.home_filled,),),label: ""),
                BottomNavigationBarItem(icon: IconButton(onPressed: (){
                  _onItemTapped(1);
                }, icon: Icon(Icons.favorite_border)),label: ""),
                BottomNavigationBarItem(icon: IconButton(onPressed: (){
                  _onItemTapped(2);
                }, icon: Icon(Icons.notifications_none)),label: ""),
                BottomNavigationBarItem(icon: IconButton(onPressed: (){
                  _onItemTapped(3);
                }, icon: Icon(Icons.person_outline)),label: ""),

              ],
              onTap: _onItemTapped,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
