import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:devquiz/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List< AwnserModel> answers;

  QuestionModel({
    this.title,
    this.answers,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List< AwnserModel>.from(map['answers'].map((x) =>  AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));


}
