import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:quiz_test/models/question.dart';


class QuestionController extends GetxController {

  // ignore: prefer_final_fields
  RxInt _currQuestion = 0.obs;
  RxInt get currQuestion => _currQuestion;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  
  List<Question> _questions = [];
  List<Question> get questions => _questions;

  increment() {
    if(currQuestion.value < questions.length - 1) {
      currQuestion.value += 1;
      update();
    }
  }

  decrement() {
    if(currQuestion.value > 0) {
      currQuestion.value -= 1;
      update();
    }
  }
  
  Future<String> _loadQuestions() async {
    return rootBundle.loadString("asset/test.json");
  }

  void initQuestions() async {
    _isLoading.value = true;
    update();

    var q = await _loadQuestions();
    List<dynamic> data = json.decode(q);
    _questions = data.map((e) => Question.fromJson(e)).toList();
    update();

   _isLoading.value = false;
   update();
  }
  
}