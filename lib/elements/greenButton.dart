import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const GreenButton({super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF00DD1D),
        minimumSize: Size(double.infinity, 60), // 버튼 크기
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Pretendard-ExtraBold',
        ),
      ),
    );
  }
}
