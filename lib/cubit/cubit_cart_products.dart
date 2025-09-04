import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/cubit/states.dart';
import 'package:shoes_app/model/shoesProduct.dart';

import '../model/cart_items.dart';

class CubitCartProduct extends Cubit<CartProductState>{
  CubitCartProduct():super(InitialCartProductState());

  final List<CartItems > cartProducts=[];
   double price =0.0;

  void addProduct(ShoesProduct product) {
    try {
      emit(LoadCartProductState());

      final index= cartProducts.indexWhere((item) =>item.product == product);
      if(index != -1){
        cartProducts[index]=cartProducts[index].copyWith(quantity:cartProducts[index].quantity + 1 );
      }else{
        cartProducts.add(CartItems(product: product, quantity: 1 ));

      }

      totalPrice();
      emit(SuccessCartProductState(cartProducts: List.from(cartProducts), totalPrice: price));
    } catch (e) {
      emit(FailCartProductState(message: e.toString()));
    }
  }


  List<ShoesProduct>  get products{
    return cartProducts.map((item) => item.product).toList(growable: false);

    }

  void removeProduct(ShoesProduct product) {
    try {
      emit(LoadCartProductState());
       cartProducts.removeWhere((item) =>item.product == product);

       totalPrice();
        emit(SuccessCartProductState(cartProducts: List.from(cartProducts), totalPrice: price));


    } catch (e) {
      emit(FailCartProductState(message: e.toString()));
    }
  }

  void clearCart() {
    try {
      emit(LoadCartProductState());
      cartProducts.clear();
      price = 0.0;
      emit(SuccessCartProductState(cartProducts: List.unmodifiable(cartProducts), totalPrice: price));

    } catch (e) {
      emit(FailCartProductState(message: e.toString()));
    }
  }




  void addPriceProduct(ShoesProduct product) {
    try {
      emit(LoadCartProductState());
      price += product.price;
      emit(SuccessCartProductState(cartProducts: List.unmodifiable(cartProducts), totalPrice: price));
    } catch (e) {
      emit(FailCartProductState(message: e.toString()));
    }
  }


  void updateQuantity(ShoesProduct product, int quantity) {
    final index = cartProducts.indexWhere((item) => item.product == product);
    if (index != -1) {
      cartProducts[index] = cartProducts[index].copyWith(quantity: quantity);
      totalPrice();
      emit(SuccessCartProductState(cartProducts: List.from(cartProducts), totalPrice: price));
    }else{
      emit(FailCartProductState(message: "Error update Quantity product"));
    }
  }
  void totalPrice(){
     price =0.0;
    for( var item in cartProducts){
      price += item.product.price * item.quantity;
    }
  }

}



