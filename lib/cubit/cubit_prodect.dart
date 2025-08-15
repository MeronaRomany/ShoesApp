import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/cubit/states.dart';
import 'package:dio/dio.dart';

import '../model/shoesProduct.dart';
class ProductsCubit extends Cubit<ProductState>{
  ProductsCubit():super(InitialState());

   List<ShoesProduct> products=[];

  Future<void> getProduct()async{
    emit(LogInState());
   try {
     var response= await Dio().get('https://dummyjson.com/products');
      List<dynamic> data=  response.data["products"];
      products = data.map((item) {
       return ShoesProduct.fromJson(item as Map<String,dynamic>);
     }).toList();
      emit(SuccessState(products: products));
   } catch (e) {

     emit(FailState(message: e.toString()));

   }

  }

}