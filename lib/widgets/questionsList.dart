import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuestionsList extends StatefulWidget {
  const QuestionsList({super.key});

  @override
  _QuestionsListState createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  // JSON 파일에서 질문 데이터 불러오기
  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('asset/data/mock_questions.json');
    final data = json.decode(response);
    setState(() {
      questions = List<Map<String, dynamic>>.from(data['questions']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: questions.isEmpty
            ? Center(child: CircularProgressIndicator()) // 로딩 중 표시
            : ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minHeight: 100, // 최소 높이 100px
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    questions[index]['content'], // 👈 `content` 필드 사용
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Pretendard-SemiBold',
                      color: Color(0xFF3B463C),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        questions[index]['is_solved'] ? 'asset/images/solved.png' : 'asset/images/unsolved.png',
                        width: 28,
                        height: 28,
                      )
                    ],
                  ),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}
