import 'package:shoes_app/model/shoesProduct.dart';

class CartItems {
  final ShoesProduct product;
  final int quantity;

  CartItems({required this.product, required this.quantity});

  CartItems copyWith({ShoesProduct? product,int? quantity}){
    return CartItems(
        product: product??this.product,
        quantity: quantity?? this.quantity);
  }




}


