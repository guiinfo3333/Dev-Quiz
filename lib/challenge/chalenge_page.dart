import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator.widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/controllers/challenge_controller.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {

  final List<QuestionModel> questions;
  final String title;


  ChallengePage(this.questions,this.title);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page.toInt()+1;
    });
    // TODO: implement initState
    super.initState();
  }

  void nextPage(){
    if(controller.currentPage<widget.questions.length)
    pageController.nextPage(
        duration: Duration(microseconds: 100),
        curve: Curves.linear
    );
  }

  void onSelected(bool value){
    if(value){
      controller.qtdAnswerRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(86),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(icon: Icon(Icons.close), onPressed: (){
                  Navigator.pop(context);
                }),
                ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context,value,_){
                  return QuestionIndicatorWidget(
                      value,
                      widget.questions.length
                  );
                }),

              ],
            ),
          ),
        ) ,
      body:PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map(
                (e) => QuizWidget(
                    e,
                    onSelected
                )
        ).toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child:ValueListenableBuilder<int>(valueListenable: controller.currentPageNotifier, builder: (context,value,_)=>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if(value<widget.questions.length)
              Expanded(child: NextButtonWidget.white("Pular",(){
                nextPage();
              })),
              if(value==widget.questions.length)
              SizedBox(width: 7,),
              if(value==widget.questions.length)
              Expanded(child: NextButtonWidget.green("Confirmar",(){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ResultPage(widget.title,widget.questions.length,controller.qtdAnswerRight)));
              })),
            ],
          )
          ),
        ),
      ),
    );
  }
}
