import 'package:flutter/material.dart';

class JobRow extends StatelessWidget {
  final List<String> jobs;
  final String selectedJob; // 현재 선택된 직군 (부모에서 전달받음)
  final Function(String) onJobSelected; // 선택된 직군을 부모에게 전달하는 콜백

  const JobRow({
    super.key,
    required this.jobs,
    required this.selectedJob,
    required this.onJobSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: jobs.map((job) {
          return EachJob(
            jobName: job,
            isSelected: job == selectedJob,
            onTap: () => onJobSelected(job), // 클릭하면 부모의 onJobSelected 실행
          );
        }).toList(),
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
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF00DD1D) : Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          jobName,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFFA7A6A2),
            fontFamily: 'Pretendard-SemiBold',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
