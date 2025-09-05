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

/////////////////////////////////////////////////////////////////

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


///////////////////////////////////////////////////////////////////////////////
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

abstract class BrandsState extends Equatable{

  List<Object?> get props => [];
}
class InitialBrandsState extends BrandsState {}

class SuccessBrandState extends BrandsState with EquatableMixin{
  int selectedIndex ;
   SuccessBrandState({required this.selectedIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}

// abstract class IsSeeAllProductState extends Equatable{
//   List<Object?> get props=>[];
//
// }
// class InitialIsSeeAllProductState extends IsSeeAllProductState{
//
// }
// class SuccessIsSeeAllProductState extends IsSeeAllProductState with EquatableMixin{
//   bool isSeeAllProductGridView ;
//   bool isSeeAllProductListView;
//
//   SuccessIsSeeAllProductState({required this.isSeeAllProductGridView,required this.isSeeAllProductListView});
//
// }



abstract class IsSeeAllProductState {
  final bool isSeeAllProductGridView;
  final bool isSeeAllProductListView;

  const IsSeeAllProductState({
    required this.isSeeAllProductGridView,
    required this.isSeeAllProductListView,
  });
}

class InitialIsSeeAllProductState extends IsSeeAllProductState {
  const InitialIsSeeAllProductState()
      : super(isSeeAllProductGridView: false, isSeeAllProductListView: false);
}

class SuccessIsSeeAllProductState extends IsSeeAllProductState {
  const SuccessIsSeeAllProductState({
    required bool isSeeAllProductGridView,
    required bool isSeeAllProductListView,
  }) : super(
    isSeeAllProductGridView: isSeeAllProductGridView,
    isSeeAllProductListView: isSeeAllProductListView,
  );
}
