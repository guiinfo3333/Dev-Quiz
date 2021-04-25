import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {

  final AwnserModel anwser;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  AwnserWidget(this.anwser,this.onTap,{this.isSelected=false,this.disabled=false});

  Color get _selectedColorRight =>  anwser.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>  anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight =>  anwser.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => anwser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => anwser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4),
      child: IgnorePointer(
        ignoring:disabled,
        child: GestureDetector(
          onTap: (){
            onTap(anwser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected?_selectedColorCardRight:AppColors.white,
                borderRadius:BorderRadius.circular(10),
                border:Border.fromBorderSide(BorderSide(
                  color:  isSelected?_selectedBorderCardRight:AppColors.white
                ))
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(anwser.title,style:isSelected?_selectedTextStyleRight:AppTextStyles.body)),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:isSelected?_selectedColorRight:AppColors.darkGreen,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(color:isSelected?_selectedBorderRight:AppColors.border)
                    )
                  ),

                  child:isSelected? Icon(Icons.check,size: 16,color: Colors.white,):null,
                )
              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
