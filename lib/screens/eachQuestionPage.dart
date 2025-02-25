import 'package:flutter/material.dart';
import 'package:inter_box/elements/greenButton.dart';
import 'package:inter_box/screens/mainPage.dart';
import 'package:inter_box/widgets/answerSection.dart';
import 'package:inter_box/widgets/topAppBar.dart';

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
      body: Column(
        children: [
          TopAppBar(title: '문제 풀이'),
          AnswerSection(),
          GreenButton(onPressed: () => _navigateToMainPage(context), buttonTitle: '저장하기',),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
