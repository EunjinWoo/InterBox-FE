import 'package:flutter/material.dart';
import 'package:inter_box/widgets/updateJobsModal.dart';

class ProfileSection extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileSection({super.key, required this.profile});

  void _openUpdateJobsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 🔥 화면을 많이 차지하도록 설정
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => UpdateJobsModal(), // 🔥 모달 띄우기
    );
  }

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
                        onTap: () => _openUpdateJobsModal(context),
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
