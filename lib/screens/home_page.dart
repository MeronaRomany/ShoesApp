import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_cart_products.dart';
import '../cubit/cubit_prodect.dart';
import '../cubit/states.dart';
import '../model/shoesProduct.dart';
import '../resources/core/route_management.dart';
import '../widgets/custom_list_view_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSeeAllProdect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(45.0),
        child: FloatingActionButton(
          onPressed: () {
           Navigator.pushNamed(context, RouteName.CartProducts);
           context.read<CubitCartProduct>().products;
          },
          backgroundColor: Colors.blue,
          elevation: 5,
          splashColor: Colors.black,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationCurve: Curves.easeOut,

        onTap: (index) {
          // setState(() {
          //   page=index;
          // });
        },
        items: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_alert_rounded, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time, color: Colors.grey),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            right: 8.0,
            left: 8.0,
            bottom: 8.0,
          ),
          child: Column(
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(Icons.pattern, color: Colors.black),
                title: Text(
                  "Store location",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_sharp, color: Colors.red),
                    Text(
                      "Mondolibug, Sylhet",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.notification_add, color: Colors.black),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Looking for shoes",
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomListViewHomePage(),
              Row(
                children: [
                  Text(
                    "Popular Shoes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSeeAllProdect = !isSeeAllProdect;
                      });
                    },
                    child: Text(
                      "see all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff5B9EE1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),

              BlocConsumer<ProductsCubit, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadProductState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FailProductState) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is SuccessProductState) {
                    return Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              isSeeAllProdect
                                  ? state.products.length
                                  : state.products.length > 2
                                  ? 2
                                  : state.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 3 / 4,
                              ),
                          itemBuilder:
                              (context, index) => GestureDetector(
                                onTap: (){
                                  final product = state.products[index];
                                  print("Selected product: ${product.title}");
                                  Navigator.pushNamed(context, RouteName.DetailsProduct,arguments:product );
                                  print("Selected product: ${product.shortDescription}");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(40),
                                        blurRadius: 5,
                                        spreadRadius: 5,
                                        offset: const Offset(-1, 0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        state.products[index].image,
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        state.products[index].title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff5B9EE1),
                                        ),
                                      ),
                                      Text(
                                        state.products[index].shortDescription,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${state.products[index].price}\$",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xff5B9EE1),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                    20,
                                                  ),
                                                ),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                   context.read<CubitCartProduct>().addProduct(state.products[index]);
                                                   //context.read<CubitCartProduct>().addPriceProduct(state.products[index]);

                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "New Arrivals",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSeeAllProdect = !isSeeAllProdect;
                                });
                              },
                              child: Text(
                                "see all",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff5B9EE1),
                                ),
                              ),
                            ),
                          ],
                        ),

                        ListView.builder(
                          itemCount:
                              isSeeAllProdect
                                  ? state.products.length
                                  : (state.products.isNotEmpty ? 1 : 0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder:
                              (context, index) => Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 5,
                                        children: [
                                          Text(
                                            state.products[index].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff5B9EE1),
                                            ),
                                          ),
                                          Text(
                                            state
                                                .products[index]
                                                .shortDescription,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "${state.products[index].price}\$",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Image.network(
                                      state.products[index].image,
                                      height: 120,
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
