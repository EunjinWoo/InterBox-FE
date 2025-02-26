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
  List<String> jobs = [];
  String selectedJob = '';

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  // JSON 파일에서 직군 리스트 불러오기
  Future<void> loadJobs() async {
    final String response = await rootBundle.loadString('assets/data/mock_my_jobs.json');
    final data = json.decode(response);

    setState(() {
      jobs = List<String>.from(data['jobs']);
      selectedJob = jobs.isNotEmpty ? jobs[0] : ''; // 기본 선택된 직군 설정
    });

    loadQuestions(selectedJob); // 기본 선택된 직군에 맞는 질문 불러오기
  }

  // 한국어 직군명을 영어 파일명으로 변환하는 함수
  String convertJobToEnglish(String job) {
    switch (job) {
      case '웹 프론트엔드':
        return 'frontend';
      case '백엔드':
        return 'backend';
      case '데이터 사이언스':
        return 'data_science';
      case '데이터 분석':
        return 'data_analysis';
      case '데이터 엔지니어링':
        return 'data_engineering';
      default:
        return 'default'; // 기본 질문 파일
    }
  }

  // JSON 파일에서 질문 불러오기
  Future<void> loadQuestions(String job) async {
    String jobEng = convertJobToEnglish(job);
    String filePath = 'assets/data/mock_${jobEng}_questions.json';

    try {
      final String response = await rootBundle.loadString(filePath);
      final data = json.decode(response);

      setState(() {
        questions = List<Map<String, dynamic>>.from(data['questions']);
      });
    } catch (e) {
      print("Error loading JSON file: $e");
      setState(() {
        questions = [];
      });
    }
  }

  // 사용자가 직군을 선택했을 때 실행되는 함수
  void onJobSelected(String job) {
    setState(() {
      selectedJob = job;
    });
    loadQuestions(job); // 선택된 직군에 맞는 질문 불러오기
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
            height: 0,
          ),
          JobRow(
            jobs: jobs,
            selectedJob: selectedJob,
            onJobSelected: onJobSelected, // 선택된 직군을 감지하는 함수 전달
          ),
          Expanded(
            child: QuestionsList(questions: questions),
          ),
        ],
      ),
    );
  }
}
