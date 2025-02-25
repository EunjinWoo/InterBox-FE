import 'package:flutter/material.dart';

class SearchPageNotice extends StatelessWidget {
  final String closestJob;

  const SearchPageNotice({super.key, required this.closestJob});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '해당 키워드는',
                style: TextStyle(
                  fontFamily: 'Pretendard-SemiBold',
                  fontSize: 14,
                  color: Color(0xFF979797),
                ),
              ),
              SizedBox(width: 4,),
              Text(
                closestJob,
                style: TextStyle(
                  fontFamily: 'Pretendard-Bold',
                  fontSize: 14,
                  color: Color(0xFF00DD1D),
                ),
              ),
              SizedBox(width: 4,),
              Text(
                '직군과 가장 관련이 깊어요!',
                style: TextStyle(
                  fontFamily: 'Pretendard-SemiBold',
                  fontSize: 14,
                  color: Color(0xFF979797),
                ),
              )
            ],
          ),
          Text(
            '검색된 키워드와 관련된 질문들이 유사도 순으로 보여집니다.',
            style: TextStyle(
              fontFamily: 'Pretendard-SemiBold',
              fontSize: 14,
              color: Color(0xFF979797),
            ),
          )
        ],
      ),
    );
  }
}
