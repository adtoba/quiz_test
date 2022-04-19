import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_test/controller/QuestionController.dart';
import 'package:quiz_test/models/question.dart';
import 'package:quiz_test/widgets/button.dart';
import 'package:quiz_test/widgets/option_button.dart';


class QuestionsPage extends StatefulWidget {
  const QuestionsPage({ Key? key }) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  int currentQuestion = 0;
  final questionController = Get.put(QuestionController());

  @override
  void initState() {
    Get.find<QuestionController>().initQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<QuestionController>(
          builder: (context) {
            var questions = questionController.questions;
            var currQuestion = questionController.currQuestion.value;

            return Container(
              padding: const EdgeInsets.all(30),
              child: questionController.isLoading ? const Center(child: CircularProgressIndicator()) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if(currQuestion > 0)...[
                          ActionButton(
                            icon: Icons.arrow_back,
                            onTap: () {
                              questionController.decrement();
                            },
                          ),
                      ],
                      const Spacer(),
                      if(currentQuestion < questionController.questions.length - 1)...[
                          ActionButton(
                          icon: Icons.arrow_forward,
                          onTap: () {
                            questionController.increment();
                          },
                        )
                      ]
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        minHeight: 15,
                        value: currQuestion / (questions.length - 1),
                        valueColor: const AlwaysStoppedAnimation(Colors.yellow),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Question ${currQuestion + 1}/${questionController.questions.length}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questions[currQuestion].q1 ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff243D25)
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: questions[currQuestion].q1Options!.map((e) {
                              return OptionButton(
                                text: e,
                                onPressed: () {
                                  if(questions[currQuestion].q1Trigger == e) {
                                    showQuestion2Sheet(questions[currQuestion]);
                                  }
                                  questionController.increment();
                                },
                              );
                            }).toList(),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.green
              ),
            );
          }
        ),
      ),
    );
  }

  void showQuestion2Sheet(Question question) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ), 
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.q2 ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff243D25)
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: question.q2Options!.map((e) {
                  return OptionButton(
                    text: e,
                    onPressed: () {
                      Navigator.pop(context);
                      questionController.increment();
                    },
                  );
                }).toList(),
              )
            ],
          ),
        );
      }
    );
  }
}