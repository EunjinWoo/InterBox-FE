import 'package:flutter/material.dart';
import 'package:inter_box/widgets/eachQuestion.dart';

class QuestionsList extends StatelessWidget {
  final List<Map<String, dynamic>> questions;

  const QuestionsList({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: questions.isEmpty
          ? Center(child: CircularProgressIndicator()) // 로딩 중 표시
          : ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          // 각 질문 컨테이너
          return EachQuestion(question: questions[index]);
        },
      ),
    );;
  }
}