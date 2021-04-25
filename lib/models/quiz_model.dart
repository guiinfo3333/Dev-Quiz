import 'dart:convert';

import 'package:devquiz/models/question_model.dart';

enum Level{facil,medio,dificil,perito}

extension LevelStringExt on String{
  Level get parse =>{
    "facil":Level.facil,
    "medio":Level.medio,
    "dificil":Level.dificil,
    "perito":Level.perito
  }[this];
}

extension LevelExt on Level{
  String get parse =>{
      Level.facil:"facil",
      Level.medio:"medio",
      Level.dificil:"dificil",
      Level.perito:"perito"
  }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;
  QuizModel(this.title,{this.questions,this.questionAnswered=0,this.imagem,this.level});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level':level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      map['title'],
      imagem: map['imagem'],
      questions: List<QuestionModel>.from(map['questions'].map((x) => QuestionModel.fromMap(x))),
      level:map['level'].toString().parse,
      questionAnswered: map['questionAnswered'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}

