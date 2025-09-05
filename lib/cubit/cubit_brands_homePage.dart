import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_app/cubit/states.dart';

class BrandsCubit extends Cubit<BrandsState>{
  BrandsCubit():super(InitialBrandsState());
  int selectedIndex = -1;
  void isSelectAnimate(int index){
    if (selectedIndex == index) {
      selectedIndex = -1; // لو ضغطت على نفس العنصر يشيل الاختيار
    } else {
      selectedIndex = index; // يخزن العنصر المختار
    }
    emit(SuccessBrandState(selectedIndex: selectedIndex));
  }

  
}