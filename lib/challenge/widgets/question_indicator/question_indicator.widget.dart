import 'package:devquiz/components/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget(this.currentPage, this.length);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:20.0),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão $currentPage",style: AppTextStyles.body,),
              Text("de $length",style: AppTextStyles.body)
            ],
          ),
          SizedBox(height:16),
          ProgressIndicatorWidget(currentPage/length)

        ],
      ),
    );
  }
}
