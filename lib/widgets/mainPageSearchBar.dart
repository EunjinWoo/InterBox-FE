import 'package:flutter/material.dart';
import 'package:inter_box/screens/myPage.dart';
import 'package:inter_box/screens/searchPage.dart';

class MainPageSearchBar extends StatelessWidget {
  const MainPageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 왼쪽 로고
            Image.asset(
              'assets/images/logo.png',
              width: 48,
              height: 38,
            ),
            SizedBox(width: 24,),

            // 검색 입력창
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5), // 배경색
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '관심 있는 키워드를 검색해보세요',
                          style: TextStyle(
                            color: Color(0xFF979797), // 텍스트 색상
                            fontSize: 12, // 폰트 크기
                            fontFamily: 'Pretendard-SemiBold'
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/searchIcon.png',
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // 프로필 이미지
            SizedBox(width: 12,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mypage()),
                );
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/profile.jpeg'), // 로컬 이미지 사용 시
                // backgroundImage: NetworkImage('https://example.com/profile.jpg'), // 네트워크 이미지 사용 시
              ),
            ),
          ],
        ),
      ),
    );
  }
}

