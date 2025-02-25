import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inter_box/elements/greenButton.dart';

class UpdateJobsModal extends StatefulWidget {
  const UpdateJobsModal({super.key});

  @override
  _UpdateJobsModalState createState() => _UpdateJobsModalState();
}

class _UpdateJobsModalState extends State<UpdateJobsModal> {
  List<Map<String, dynamic>> jobs = [];

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  // JSON 파일에서 직군 데이터 불러오기
  Future<void> loadJobs() async {
    final String response = await rootBundle.loadString('assets/data/mock_jobs.json');
    final data = json.decode(response);
    setState(() {
      jobs = List<Map<String, dynamic>>.from(data['jobs']);
    });
  }

  // 직군 선택 상태 변경
  void toggleJobSelection(int index) {
    setState(() {
      jobs[index]['is_selected'] = !jobs[index]['is_selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 모달 높이를 내용에 맞춤
        children: [
          // 상단 타이틀 & 닫기 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '직군 수정하기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 16),

          // 직군 선택 리스트 (JSON 데이터 기반)
          jobs.isEmpty
              ? CircularProgressIndicator() // 데이터 로딩 중
              : Column(
            children: jobs.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> job = entry.value;
              return GestureDetector(
                onTap: () => toggleJobSelection(index), // 클릭 시 상태 변경
                child: _buildJobItem(job),
              );
            }).toList(),
          ),

          SizedBox(height: 20),

          // 저장하기 버튼 (API 연동 시 서버로 데이터 전송 가능)
          GreenButton(
            onPressed: () {
              print('Updated Jobs: $jobs'); // 현재 선택된 값 확인
              Navigator.pop(context); // 저장 후 모달 닫기
            },
            buttonTitle: '저장하기'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // 직군 선택 UI (클릭 시 색상 변경)
  Widget _buildJobItem(Map<String, dynamic> job) {
    bool isSelected = job['is_selected'];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFE6FCE6) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? Color(0xFF00DD1D) : Color(0xFFBFBFBF)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            job['name'],
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Pretendard-SemiBold',
              color: isSelected ? Color(0xFF00DD1D) : Color(0xFF3B463C),
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle : Icons.check_circle_outline,
            color: isSelected ? Color(0xFF00DD1D) : Colors.grey,
          ),
        ],
      ),
    );
  }
}
