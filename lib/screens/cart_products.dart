import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cart_products.dart';
import '../cubit/states.dart';
import '../model/shoesProduct.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // final product = ModalRoute.of(context)!.settings.arguments as ShoesProduct;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CubitCartProduct, CartProductState>(
              builder: (context, state) {
                final cubit = context.read<CubitCartProduct>();
                if (state is LoadCartProductState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FailCartProductState) {
                  return Center(
                    child: Text(
                      "Error: ${state.message}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: cubit.cartProducts.length,

                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder:
                        (context, index) => Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(40),
                                blurRadius: 5,
                                spreadRadius: 5,
                                offset: const Offset(-1, 0),
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              Image.network(
                                cubit.cartProducts[index].product.image,
                                height: 120,
                                cacheHeight: 120,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 5,
                                  children: [
                                    Text(
                                      cubit.cartProducts[index].product.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5B9EE1),
                                      ),
                                    ),
                                    Text(
                                      cubit.cartProducts[index].product.shortDescription,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "${cubit.cartProducts[index].product.price}\$",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18),
                                    ),

                                    CartStepperInt(
                                      axis: Axis.horizontal,
                                      value: cubit.cartProducts[index].quantity,
                                      size: 30,
                                      didChangeCount: (int value) {
                                        cubit.updateQuantity(
                                          cubit.cartProducts[index].product,
                                          value,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                               spacing: 30,
                                children: [
                                  Text("xxl", style: TextStyle(fontSize: 18)),
                                  IconButton(
                                    onPressed: () {
                                      cubit.removeProduct(
                                        cubit.cartProducts[index].product,
                                      );
                                    },
                                    icon: Icon(Icons.delete, size: 20,color: Colors.grey,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  );
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<CubitCartProduct, CartProductState>(
              builder: (context, state) {
                final cubit = context.read<CubitCartProduct>();

                if (state is LoadCartProductState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FailCartProductState) {
                  return Center(
                    child: Text(
                      "Error: ${state.message}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {

                  final subtotal = cubit.price;
                  final shipping = 50;
                  final total = subtotal + shipping;

                  return Column(
                    spacing: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal :", style: TextStyle(color: Colors.grey, fontSize: 18)),
                          Text("\$${subtotal.toStringAsFixed(2)}", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping :", style: TextStyle(color: Colors.grey, fontSize: 18)),
                          Text("\$${shipping.toStringAsFixed(2)}", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TotalCost :", style: TextStyle(fontSize: 20)),
                          Text("\$${total.toStringAsFixed(2)}", style: TextStyle(color: Colors.black, fontSize: 20)),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            "Check Out",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),


          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     child: Column(
          //       spacing: 10,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               "Subtotal :",
          //               style: TextStyle(color: Colors.grey, fontSize: 18),
          //             ),
          //             Text("450\$", style: TextStyle(fontSize: 20)),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
          //           children: [
          //             Text(
          //               "Shopping : ",
          //               style: TextStyle(color: Colors.grey, fontSize: 18),
          //             ),
          //             Text("450\$", style: TextStyle(fontSize: 20)),
          //           ],
          //         ),
          //         VerticalDivider(
          //           width: 200,
          //           thickness: 5.0,
          //           color: Colors.red,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
          //           children: [
          //             Text("TotalCost :", style: TextStyle(fontSize: 20)),
          //
          //             BlocBuilder<CubitCartProduct, CartProductState>(
          //               builder: (context, state) {
          //                 final cubit = context.read<CubitCartProduct>();
          //                 if (state is LoadCartProductState) {
          //                   return Center(child: CircularProgressIndicator());
          //                 } else if (state is FailCartProductState) {
          //                   return Center(
          //                     child: Text(
          //                       "Error: ${state.message}",
          //                       style: const TextStyle(color: Colors.red),
          //                     ),
          //                   );
          //                 } else {
          //                   return Text(
          //                     "${cubit.price}",
          //                     style: TextStyle(color: Colors.grey),
          //                   );
          //                 }
          //               },
          //             ),
          //           ],
          //         ),
          //         Container(
          //           height: 50,
          //           width: double.infinity,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.blue,
          //           ),
          //           child: Center(
          //             child: Text(
          //               "Check Out",
          //               style: TextStyle(fontSize: 20, color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
