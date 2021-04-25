import 'dart:ffi';

import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:devquiz/models/quiz_model.dart';
import 'package:devquiz/models/user_model.dart';
import 'package:devquiz/repositorys/home_repository.dart';
import 'package:devquiz/states/home_state.dart';
import 'package:flutter/cupertino.dart';

class HomeController{
  final stateNotifier=ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel user;
  List<QuizModel> quizzes;

  final repository = HomeRepository();



  void getUser() async{
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));
    quizzes  =await repository.getQuizzes();
    state = HomeState.sucess;
  }
}