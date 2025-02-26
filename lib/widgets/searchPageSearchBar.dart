import 'package:flutter/material.dart';

class SearchPageSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const SearchPageSearchBar({super.key, required this.onSearch});

  @override
  State<SearchPageSearchBar> createState() => _SearchPageSearchBarState();
}

class _SearchPageSearchBarState extends State<SearchPageSearchBar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
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
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 24),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE1E1E1), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
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
                        ),
                        onSubmitted: (value) {
                          widget.onSearch(value); // 검색어 입력 시 부모 위젯(SearchPage)에게 전달
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        widget.onSearch(_controller.text); // 검색 아이콘 클릭 시 검색 실행
                      },
                      child: Image.asset(
                        'assets/images/searchIcon.png',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
