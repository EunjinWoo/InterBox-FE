import 'package:flutter/material.dart';
import 'package:inter_box/elements/greenButton.dart';
import 'package:inter_box/screens/mainPage.dart';
import 'package:inter_box/widgets/answerSection.dart';
import 'package:inter_box/widgets/eachQuestion.dart';
import 'package:inter_box/elements/topAppBar.dart';

class EachQuestionPage extends StatelessWidget {
  final Map<String, dynamic> question;

  const EachQuestionPage({super.key, required this.question});

  void _navigateToMainPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TopAppBar(title: '문제 풀이'),
            Divider(
              color: Color(0xFFE1E1E1),
              thickness: 0.5,
              height: 0, // 상하 여백
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    EachQuestion(question: question),
                    Expanded(child: AnswerSection()),
                    SizedBox(height: 12,),
                    GreenButton(onPressed: () => _navigateToMainPage(context), buttonTitle: '저장하기',),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
