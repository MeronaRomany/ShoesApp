import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/cubit/states.dart';
import 'package:dio/dio.dart';

import '../model/shoesProduct.dart';
class ProductsCubit extends Cubit<ProductState>{
  ProductsCubit():super(InitialProductState());

   List<ShoesProduct> products=[];
   bool isActive=false;
   List<String> optionsSize=["uk","ex","gu"];
   int selectIndexSize=0;
  int selectIndexSizelistView=0;
  List<String> optionsSizelistView=["30","35","40","42","45","48"];

  Future<void> getProduct()async{
    emit(LoadProductState());
   try {
     var response= await Dio().get('https://shoes-collections.p.rapidapi.com/shoes',
         options: Options(
           headers: {
             "x-rapidapi-host": "shoes-collections.p.rapidapi.com",
             "x-rapidapi-key":"c7bbacd20fmshfa6a32730b0a86cp1697f3jsn201bc5c20b21",

           },
         ),);

      List<dynamic> data=  response.data;
      products = data.map((item) {
       return ShoesProduct.fromJson(item as Map<String,dynamic>);
     }).toList();
      emit(SuccessProductState(products: products));
   } catch (e) {

     emit(FailProductState(message: e.toString()));

   }

  }


 void changeSelectedIndex(int index){
   selectIndexSize=index;

  emit(SizeSelectedSystemState(selectedSystemIndex:selectIndexSize ));
 }

  void changeSelectedIndexlistView(int index){
    selectIndexSizelistView=index;
   emit(SelectedSizeState(selectedSizeIndex:selectIndexSizelistView ));
  }
}