import 'package:flutter/material.dart';

class AnswerSection extends StatelessWidget {
  const AnswerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '답변을 작성해주세요.',
            style: TextStyle(
              fontFamily: 'Pretendard-Medium',
              fontSize: 16,
              color: Color(0xFF9C9C9C),
            ),
          ),
          SizedBox(height: 4,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFBFBFBF),
                    width: 1,
                  )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: Color(0xFF4F4F4F),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard-Medium',
                    color: Color(0xFF4F4F4F),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
