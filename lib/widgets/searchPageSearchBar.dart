import 'package:flutter/material.dart';

class SearchPageSearchBar extends StatefulWidget {

  const SearchPageSearchBar({super.key});

  @override
  State<SearchPageSearchBar> createState() => _SearchPageSearchBarState();
}

class _SearchPageSearchBarState extends State<SearchPageSearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 화면이 로드될 때 TextField가 자동으로 활성화되도록 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE1E1E1),
                  width: 1,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        cursorColor: Color(0xFF3B463C),
                        style: TextStyle(
                          color: Color(0xFF3B463C),
                          fontFamily: 'Pretendard-SemiBold',
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '관심 있는 키워드를 검색해보세요',
                          hintStyle: TextStyle(
                            color: Color(0xFF979797),
                            fontFamily: 'Pretendard-Medium',
                            fontSize: 16,
                          ),
                        )
                      )
                    ),
                    SizedBox(width: 8,),
                    Image.asset(
                      'assets/images/searchIcon.png',
                      height: 18,
                      width: 18,
                    ),
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
