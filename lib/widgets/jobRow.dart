import 'package:flutter/material.dart';

class JobRow extends StatefulWidget {
  final List<String> jobs;

  const JobRow({super.key, required this.jobs});

  @override
  _JobRowState createState() => _JobRowState();
}

class _JobRowState extends State<JobRow> {
  late String selectedJob; // 선택된 직군 (초기값 설정을 위해 `late` 사용)

  @override
  void initState() {
    super.initState();
    selectedJob = widget.jobs.isNotEmpty ? widget.jobs[0] : ''; // 첫 번째 직군 선택
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.jobs.map((job) {
            return EachJob(
              jobName: job,
              isSelected: job == selectedJob,
              onTap: () {
                setState(() {
                  selectedJob = job;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class EachJob extends StatelessWidget {
  final String jobName;
  final bool isSelected;
  final VoidCallback onTap;

  const EachJob({
    super.key,
    required this.jobName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4), // 간격 조절
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 내부 여백
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF00DD1D) : Color(0xFFF3F3F3), // 선택된 경우 초록색
          borderRadius: BorderRadius.circular(20), // 둥근 테두리
        ),
        child: Text(
          jobName,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFFA7A6A2), // 글씨 색상 조절
            fontFamily: 'Pretendard-Medium',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}