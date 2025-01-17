import 'package:flutter/material.dart';
import 'util/age_selector.dart';

void main() {
  runApp(AnimalChatApp());
}

class AnimalChatApp extends StatefulWidget {
  @override
  _AnimalChatAppState createState() => _AnimalChatAppState();
}

class _AnimalChatAppState extends State<AnimalChatApp> {
  bool isDarkMode = false;
  int selectedMinAge = 20; // 설정 최소 나이 불러오기
  int selectedMaxAge = 40; // 설정 최대 나이 불러오기

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: isDarkMode ? Colors.black : Colors.white,
      ),
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '동물 ',
                    style: TextStyle(
                      color: Color(0xFFBE95C4),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '챗',
                    style: TextStyle(
                      color: Color(0xFFE0B1CB),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              activeColor: Color(0xFF9F86C0),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // 원하는 높이 설정 (여기서는 16dp)
              // 좋아하는 동물
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF5E548E), // 박스 배경색
                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                ),
                child: Text(
                  '좋아하는 동물',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 텍스트 색상 (가독성 위해 흰색)
                  ),
                ),
              ),
              SizedBox(height: 30),
              // INFJ
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFBE95C4), // 박스 배경색
                  borderRadius: BorderRadius.circular(8), // 둥근 모서리
                ),
                child: Text(
                  'INFJ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 텍스트 색상 (가독성 위해 흰색)
                  ),
                ),
              ),

              // 나이 선택 위젯 호출
              AgeSelector(
                //selectedMinAge: selectedMinAge,
                //selectedMaxAge: selectedMaxAge,
                // onAgeChanged: (minAge , maxAge) {
                //   setState(() {
                //     selectedMinAge = minAge;
                //     selectedMaxAge = maxAge;
                //   });
                // },
              ),

              SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,  // 한 줄에 3개의 항목
                  crossAxisSpacing: 13,  // 항목들 간의 가로 간격
                  childAspectRatio: 1,  // 각 항목의 가로:세로 비율
                  children: [
                    _buildIconButton(Icons.send, '메세지 보내기'),
                    _buildIconButton(Icons.message, '받은 메세지'),
                    _buildIconButton(Icons.settings, '설정'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Material(
      color: Color(0xFF9F86C0), // 기본 배경색
      borderRadius: BorderRadius.circular(16), // 버튼 모서리 둥글게
      child: InkWell(
        onTap: () {
          //print('$label 버튼이 눌렸습니다.');
        },
        borderRadius: BorderRadius.circular(16), // InkWell의 테두리 둥글게
        splashColor: Colors.black.withOpacity(0.2), // 누를 때 퍼지는 효과
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 아이콘과 텍스트 정렬
            children: [
              Icon(icon, size: 35, color: Colors.white), // 아이콘
              SizedBox(height: 8), // 아이콘과 텍스트 간격
              Text(
                label,
                style: TextStyle(
                  color: Colors.white, // 텍스트 색
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
}