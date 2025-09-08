import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_brands_homePage.dart';
import '../cubit/states.dart';
import '../resources/core/brands_model.dart';
import 'custum_item_componanet_listView.dart';

class CustomListViewHomePage extends StatelessWidget {
   CustomListViewHomePage({super.key});
  BrandeShoes brandeShoes = BrandeShoes();


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BrandsCubit>();
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder:
            (context, index) =>
                BlocBuilder<BrandsCubit, BrandsState>(
              builder:
                  (context, state) =>
                      CustumItemComponanetListview(
                                          isAnimate: cubit.selectedIndex==index,
                                          onTap: () {
                      cubit.isSelectAnimate(index);
                                          },
                        image:brandeShoes.optionsBrandeShoes[index].image ,
                        title: brandeShoes.optionsBrandeShoes[index].title,
                                        ),

            ),
      ),
    );
  }
}
