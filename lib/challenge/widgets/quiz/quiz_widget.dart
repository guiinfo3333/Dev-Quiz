import 'package:devquiz/challenge/widgets/awnser/awnser.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget(this.question,this.onSelected);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel answers (int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question.title,style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i=0;i<widget.question.answers.length;i++)
            AwnserWidget(
                   answers(i),
                    (value){
                     indexSelected = i;
                     setState(() {
                     });
                     Future.delayed(Duration(seconds: 1)).then((_) =>
                         widget.onSelected(value));

                    },
                disabled: indexSelected != -1,
                isSelected:indexSelected==i
            ),
        ],
      ),
    );
  }
}
