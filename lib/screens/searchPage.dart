import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inter_box/widgets/searchPageNotice.dart';
import 'package:inter_box/widgets/searchPageSearchBar.dart';

import '../widgets/questionsList.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String closestJob = '';
  List<Map<String, dynamic>> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  // JSON 파일에서 질문 데이터 불러오기
  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/data/mock_search_api.json');
    final data = json.decode(response);
    setState(() {
      closestJob = data['closest_job'];
      questions = List<Map<String, dynamic>>.from(data['questions']);
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
      body: Column(
        children: [
          SearchPageSearchBar(),
          SearchPageNotice(closestJob: closestJob),
          Expanded(
            child: QuestionsList(questions: questions),
          ),
        ],
      ),
    );
  }
}
