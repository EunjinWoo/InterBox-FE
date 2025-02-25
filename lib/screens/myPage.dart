import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inter_box/elements/topAppBar.dart';
import 'package:inter_box/widgets/profileSection.dart';
import 'package:inter_box/widgets/questionsList.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  List<Map<String, dynamic>> questions = [];
  Map<String, dynamic> profile = {
    "name" : "null",
    "jobs": [],
    "profile_image": "null"
  };

  @override
  void initState() {
    super.initState();
    loadQuestions();
    loadProfile();
  }

  // JSON 파일에서 질문 데이터 불러오기
  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/data/mock_questions.json');
    final data = json.decode(response);
    setState(() {
      questions = List<Map<String, dynamic>>.from(data['questions']);
    });
  }

  // JSON 파일에서 프로필 데이터 불러오기
  Future<void> loadProfile() async {
    final String response = await rootBundle.loadString('assets/data/mock_profile.json');
    final data = json.decode(response);
    setState(() {
      profile = Map<String, dynamic>.from(data);
    });
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
            TopAppBar(title: '마이페이지'),
            ProfileSection(profile: profile,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE4E4E4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('푼 문제', style: TextStyle(fontSize: 14, fontFamily: 'Pretendard-Medium', color: Color(0xFF2B291D)),),
                  )
                ],
              ),
            ),
            Expanded(child: QuestionsList(questions: questions))
          ],
        ),
      ),
    );
  }
}
