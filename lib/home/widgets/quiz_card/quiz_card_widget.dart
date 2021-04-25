import 'package:devquiz/components/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {

    final String title;
    final String completed;
    final double percent;
    final VoidCallback onTap;

    QuizCardWidget(this.title,this.completed,this.percent,this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(color: AppColors.border),
            )
                ,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(height: 14,),
              Text(
                  title,
                  style: AppTextStyles.heading15
              ),
              SizedBox(height: 14,),
              Row(
                children: [
                  Expanded(flex:1,child: Text(completed, style: AppTextStyles.body11)),
                  Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(percent)
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
