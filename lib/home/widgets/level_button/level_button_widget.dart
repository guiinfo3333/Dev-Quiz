import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {

  final String label;

  LevelButtonWidget(this.label):assert(["Fácil","Médio","Difícil","Perito"].contains(label));

  final config = {
    "Fácil" : {
      "color" : AppColors.levelButtonFacil,
      "borderColor" : AppColors.levelButtonBorderFacil,
      "fontColor" : AppColors.levelButtonTextFacil
    },
    "Médio" : {
      "color" : AppColors.levelButtonMedio,
      "borderColor" : AppColors.levelButtonBorderMedio,
      "fontColor" : AppColors.levelButtonTextMedio
    },
    "Difícil" : {
      "color" : AppColors.levelButtonDificil,
      "borderColor" : AppColors.levelButtonBorderDificil,
      "fontColor" : AppColors.levelButtonTextDificil
    },
    "Perito" : {
      "color" : AppColors.levelButtonPerito,
      "borderColor" : AppColors.levelButtonBorderPerito,
      "fontColor" : AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[label]['color'];
  Color get bordercolor => config[label]['borderColor'];
  Color get fontcolor => config[label]['borderColor'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: bordercolor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 6),
        child: Text(label,
          style: GoogleFonts.notoSans(
          color: fontcolor,
          fontSize: 13
        ),),
      )
    );
  }
}

