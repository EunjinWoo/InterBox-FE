import 'package:flutter/material.dart';
import 'package:inter_box/widgets/appSearchBar.dart';
import 'package:inter_box/widgets/jobRow.dart';
import 'package:inter_box/widgets/questionsList.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSearchBar(),
          Divider(
            color: Color(0xFFE1E1E1),
            thickness: 0.5,
            height: 0, // 상하 여백
          ),
          JobRow(
            jobs: ['FrontEnd', 'BackEnd', 'DataEngineering'],
          ),
          QuestionsList(),
        ],
      ),
    );
  }
}
