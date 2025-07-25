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
      body: Padding(
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
            CustomListViewHomePage()
          ],
        ),
      ),
    ) ;
  }
}
