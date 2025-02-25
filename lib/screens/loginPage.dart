import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // 로고 이미지 
            Image.asset(
              'asset/images/logo.png',
              width: 127,
              height: 100,
            ),
            SizedBox(height: 60),

            // ID 입력 필드
            TextField(
              decoration: InputDecoration(
                labelText: 'id',
                labelStyle: TextStyle(
                  color: Color(0xFF00DD1D),
                  fontSize: 16,
                  fontFamily: 'Pretendard-SemiBold',
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00DD1D)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00DD1D), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // PW 입력 필드
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'pw',
                labelStyle: TextStyle(
                  color: Color(0xFF00DD1D),
                  fontSize: 16,
                  fontFamily: 'Pretendard-SemiBold',
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00DD1D)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00DD1D), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 40),

            Spacer(),

            // 로그인 버튼
            ElevatedButton(
              onPressed: () {
                // 로그인 기능 구현
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00DD1D),
                minimumSize: Size(double.infinity, 60), // 버튼 크기
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Pretendard-ExtraBold',
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
