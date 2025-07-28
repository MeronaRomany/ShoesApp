import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'on_borading_model.dart';

class OnBoardingController{

  final PageController controllerNavagationBar=PageController();
  StreamController<int>? streamController;
  late Sink<int>? inputStream;
  late Stream<int>? outputStream;
  OnBoardingController(){
    streamController=StreamController();
    inputStream=streamController?.sink;
    outputStream=streamController?.stream;
    inputStream?.add(checkIndex);
  }
  final List<OnBoardingModel> onBoardindList=[
    OnBoardingModel(
        image: "assets/images/Digital Sketches_prev_ui.png",
        title2: "Start Journey With Nike",
        title1: "Smart, Gorgeous & Fashionable Collection"),
    OnBoardingModel(
        image: "assets/images/Group 285 (1).png",
        title2: "Follow Latest Style Shoes",
        title1: "There Are Many Beautiful And Attractive Plants To Your Room"),

    OnBoardingModel(
        image: "assets/images/Spring_prev_ui 1.png",
        title2: "Summer Shoes Nike 2022",
        title1: "Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor")
  ];

  int checkIndex=-1;

  void nextPageView(int index){
    if(checkIndex != index && checkIndex <index){
      index++;
    }
    inputStream!.add(index);
  }
}