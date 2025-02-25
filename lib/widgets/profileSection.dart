import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(profile['profile_image']), // 로컬 이미지 사용 시
                // backgroundImage: NetworkImage('https://example.com/profile.jpg'), // 네트워크 이미지 사용 시
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profile['name'],
                        style: TextStyle(
                          fontFamily: 'Pretendard-SemiBold',
                          fontSize: 20,
                          color: Color(0xFF2B291D),
                        ),
                      ),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFFDCDCDC),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '직군 수정',
                            style: TextStyle(
                              fontFamily: 'Pretendard-Medium',
                              fontSize: 12,
                              color: Color(0xFF4F4F4F),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4,),
                  Text(
                    profile['jobs'],
                    style: TextStyle(
                      fontFamily: 'Pretendard-Regular',
                      fontSize: 12,
                      color: Color(0xFF555555),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
              SizedBox(width: 20,),
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
