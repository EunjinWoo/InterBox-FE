import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inter_box/widgets/mainPageSearchBar.dart';
import 'package:inter_box/widgets/jobRow.dart';
import 'package:inter_box/widgets/questionsList.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  // JSON 파일에서 질문 데이터 불러오기
  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/data/mock_questions.json');
    final data = json.decode(response);
    setState(() {
      questions = List<Map<String, dynamic>>.from(data['questions']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          MainPageSearchBar(),
          Divider(
            color: Color(0xFFE1E1E1),
            thickness: 0.5,
            height: 0, // 상하 여백
          ),
          JobRow(
            jobs: ['FrontEnd', 'BackEnd', 'DataEngineering'],
          ),
          Expanded(
            child: QuestionsList(questions: questions),
          ),
        ],
      ),
    );
  }
}
