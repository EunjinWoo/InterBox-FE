import 'package:flutter/material.dart';
import 'package:inter_box/screens/eachQuestionPage.dart';

class EachQuestion extends StatelessWidget {
  final Map<String, dynamic> question;

  const EachQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EachQuestionPage(question: question,)),
        );
      },
      child: Container(
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
                question['content'],
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
                    question['is_solved'] ? 'assets/images/solved.png' : 'assets/images/unsolved.png',
                    width: 28,
                    height: 28,
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
