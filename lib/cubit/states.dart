import '../model/shoesProduct.dart';

abstract class ProductState{}

class InitialState extends ProductState{}
class LogInState extends ProductState{}

class FailState extends ProductState{
  String message;
  FailState({required this.message});
}
class SuccessState extends ProductState{
  List<ShoesProduct> products=[];

  SuccessState({required this.products});
}
