import 'package:flutter/material.dart';
import 'package:inter_box/widgets/searchPageNotice.dart';
import 'package:inter_box/widgets/searchPageSearchBar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          SearchPageSearchBar(),
          SearchPageNotice(closestJob: "웹 프론트엔드"),
        ],
      ),
    );
  }
}
