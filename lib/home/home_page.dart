import 'package:devquiz/challenge/chalenge_page.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/controllers/home_controller.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/widgets/appbar/app_bar.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/states/home_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  @override
  void initState() {
    super.initState();
      controller.getUser();
      controller.getQuizzes();
      controller.stateNotifier.addListener(() {
        setState(() {
        });
      });
  }
  @override
  Widget build(BuildContext context) {

    if(controller.state == HomeState.sucess){
      return Scaffold(
        appBar: AppBarWidget(controller.user),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                        "Fácil"
                    ),
                    LevelButtonWidget(
                        "Médio"
                    ),
                    LevelButtonWidget(
                        "Difícil"
                    ),LevelButtonWidget(
                        "Perito"
                    ),

                  ],
                ),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes.map((e) => QuizCardWidget(
                    e.title,
                    "${e.questionAnswered}/${e.questions.length}",
                    e.questionAnswered/e.questions.length,
                      (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=> ChallengePage(e.questions,e.title)));
                      }
                  )).toList(),
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

  }
}
