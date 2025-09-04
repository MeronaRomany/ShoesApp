import 'package:equatable/equatable.dart';
import 'package:shoes_app/model/cart_items.dart';
import '../model/shoesProduct.dart';

/// --------------------
/// States خاصة بالـ ProductsCubit
/// --------------------
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialProductState extends ProductState {}

class LoadProductState extends ProductState {}

class FailProductState extends ProductState {
  final String message;
  FailProductState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SuccessProductState extends ProductState {
  final List<ShoesProduct> products;
  SuccessProductState({required this.products});

  @override
  List<Object?> get props => [products];
}



/// --------------------
/// States خاصة بالـ CubitCartProduct
/// --------------------
abstract class CartProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCartProductState extends CartProductState {}

class LoadCartProductState extends CartProductState {}

class FailCartProductState extends CartProductState {
  final String message;
  FailCartProductState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SuccessCartProductState extends CartProductState {
  final List<CartItems> cartProducts;
  final double totalPrice;

  SuccessCartProductState({
    required this.cartProducts,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [cartProducts, totalPrice];
}



class SizeSelectedSystemState extends ProductState with EquatableMixin {
  final int selectedSystemIndex;
  SizeSelectedSystemState({required this.selectedSystemIndex});

  @override
  List<Object?> get props => [selectedSystemIndex];
}


class SelectedSizeState extends ProductState with EquatableMixin{

  final int selectedSizeIndex;       // 30/35/40..
  SelectedSizeState({required this.selectedSizeIndex});
  List<Object?> get props => [selectedSizeIndex];

}