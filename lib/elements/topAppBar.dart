import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final String title;

  const TopAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 뒤로가기 버튼
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // 뒤로 가기 기능
                },
                child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 24),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Pretendard-SemiBold',
                  color: Color(0xFF4F4F4F),
                ),
              ),
              SizedBox(width: 24,),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFE1E1E1),
          thickness: 0.5,
          height: 0, // 상하 여백
        ),
      ],
    );
  }
}
