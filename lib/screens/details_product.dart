import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/widgets/custom_list_view_size_shoes.dart';

import '../cubit/cubit_cart_products.dart';
import '../cubit/cubit_prodect.dart';
import '../cubit/states.dart';
import '../model/shoesProduct.dart';
import '../resources/core/route_management.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ShoesProduct;
    print(product.title);
    print(product.image);
    print(product.price);
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
     appBar: AppBar(
       backgroundColor: Color(0xfff8f9fa),
       title: Text("Men\'s shoes",style: TextStyle(fontWeight: FontWeight.bold),),
       centerTitle: true,
       leading:
       ClipRRect(
         borderRadius: BorderRadius.circular(50),
         child: Container(
         color: Colors.white,
           child: IconButton(onPressed:(){
             Navigator.pop(context);
           },
               icon: Icon(Icons.arrow_back_ios_new)),
         ),
       ),
     actions: [
       ClipRRect(
         borderRadius: BorderRadius.circular(50),
         child: Container(
         color: Colors.white,
             child: IconButton(onPressed:(){},
             icon: Icon(Icons.account_box_outlined)),
             ),
       ),
       ],
     ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(product.image,
            height: 250,width: double.infinity,
            fit: BoxFit.cover
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,style: TextStyle(color: Colors.blueAccent,
                    fontSize: 18)),
                Text(product.shortDescription,style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold)),
                Text("${product.price}\$",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold)),
                Text("Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....",
                  style: TextStyle(color: Colors.grey,
                  fontSize: 18),),
                Text("Gallery",style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold)),


                 Container(
                    height: 50,
                    child: ListView.builder(
                        itemBuilder: (context,index)=>
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(40)
                              ),
                              child: Image.network(product.image,height: 50,width: 50,),
                            ),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                 Row(
                   children: [
                     Text("Size",style: TextStyle(
                         fontSize: 20,fontWeight: FontWeight.bold)),
                     Spacer(),
                     // BlocBuilder خاص بالنظام (uk, ex, gu)
                     BlocBuilder<ProductsCubit, ProductState>(
                       builder: (context, state) {
                         final cubit = context.watch<ProductsCubit>();

                         return Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: List.generate(
                             cubit.optionsSize.length,
                                 (index) {
                               bool isSelected = cubit.selectIndexSize == index; // ✅ من الكيوبت

                               return GestureDetector(
                                 onTap: () {
                                   cubit.changeSelectedIndex(index);
                                 },
                                 child: Text(
                                   cubit.optionsSize[index],
                                   style: TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                     color: isSelected ? Colors.black : Colors.grey,
                                   ),
                                 ),
                               );
                             },
                           ),
                         );
                       },
                     ),





                   ],
                 ),



                BlocBuilder<ProductsCubit, ProductState>(
                  builder: (context, state) {
                    final cubit = context.watch<ProductsCubit>(); // ✅ عشان يتحدث مع كل emit
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.optionsSizelistView.length,
                        itemBuilder: (context, index){
                          bool isSelected = cubit.selectIndexSizelistView==index;
                          return GestureDetector(
                            onTap: () {
                              cubit.changeSelectedIndexlistView(index);
                              // String? size=cubit.isSelectSize();
                            },
                            child: CustomListViewSizeShoes(
                              backgroundContainer:isSelected
                                  ? Colors.blue
                                  : Colors.white,
                              textColor:isSelected
                                  ? Colors.white
                                  : Colors.grey,
                              textSize: cubit.optionsSizelistView[index],
                            ),
                          );
                        }

                      ),
                    );
                  },
                ),

                SizedBox(height: 5,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price",style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey)),
                        Text("${product.price}",style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        final cubit = context.read<ProductsCubit>();

                        context.read<CubitCartProduct>().addProduct(product);
                       // Navigator.pushReplacementNamed(context, RouteName.CartProducts,arguments:cubit.selectSize );
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(child: Text("Add To Cart",style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),

                      ),
                    )
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
