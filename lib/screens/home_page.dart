import 'package:flutter/material.dart';

import '../widgets/custom_list_view_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18,right: 8.0,left: 8.0,bottom: 8.0),
          child: Column(
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(Icons.pattern,color: Colors.black),
                title: Text("Store location",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.location_on_sharp,color: Colors.red,),
                  Text("Mondolibug, Sylhet",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                ],),
                trailing: Icon(Icons.notification_add,color: Colors.black),
              ),
             SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Looking for shoes",
                  prefixIcon: Icon(Icons.search_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )
                  ),

                ),
              ),
              SizedBox(height: 10,),
              CustomListViewHomePage(),
              Row(
                children: [
                  Text("Popular Shoes",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("see all",style: TextStyle(fontSize: 18,color:Color(0xff5B9EE1), ),),
                ],
              ),
              SizedBox(height: 5,),

              GridView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                ),
                itemBuilder: (context,index)=>
                    Container(
                      height: 400,
                       width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 5,
                        children: [
                        Image.asset("assets/images/Digital Sketches_prev_ui.png",height: 120,),
                        Text("Best Seller",maxLines: 2,overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),),
                        Text("Nike Jordan",maxLines: 2,overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),),
                        Row(
                          children: [
                            Text("40\$",maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),),
                            Container(
                             decoration: BoxDecoration(
                               color: Color(0xff5B9EE1),
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                             ),
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                            )
                          ],
                        ),
                      ],),
                    ),
                ),
              ),
              SizedBox(height: 5,),
              // Row(
              //   children: [
              //     Text("New Arrivals",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              //     Spacer(),
              //     Text("see all",style: TextStyle(fontSize: 18,color:Color(0xff5B9EE1), ),),
              //   ],
              // ),
              // SizedBox(
              //
              //   child: ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (context,index)=>
              //           Container(
              //              margin: EdgeInsets.all(10),
              //              padding: EdgeInsets.all(10),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Colors.red,
              //             ),
              //             child: Row(
              //               children: [
              //                 Column(
              //                   spacing: 5,
              //                   children: [
              //
              //                     Text("Best Seller",maxLines: 2,overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(fontSize: 18),),
              //                     Text("Nike Jordan",maxLines: 2,overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(fontSize: 18),),
              //                     Row(
              //                       children: [
              //                         Text("40\$",maxLines: 2,overflow: TextOverflow.ellipsis,
              //                           style: TextStyle(fontSize: 18),),
              //                         Container(
              //                           decoration: BoxDecoration(
              //                             color: Color(0xff5B9EE1),
              //                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              //                           ),
              //                           child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
              //                         )
              //                       ],
              //                     ),
              //                   ],),
              //                 Spacer(),
              //                 Image.asset("assets/images/Digital Sketches_prev_ui.png",height: 120,),
              //               ],
              //             ),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    ) ;
  }
}
