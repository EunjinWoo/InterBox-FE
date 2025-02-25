import 'package:flutter/material.dart';
import 'package:inter_box/elements/greenButton.dart';
import 'package:inter_box/screens/mainPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _navigateToMainPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

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
              'assets/images/logo.png',
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
            GreenButton(onPressed: () => _navigateToMainPage(context), buttonTitle: '로그인',),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
