import 'package:animal_project/page/receive.dart';
import 'package:animal_project/page/send.dart';
import 'package:flutter/material.dart';
import '../util/age_selector.dart';

// void main() {
//   runApp(AnimalChatApp());
// }

class AnimalChatApp extends StatefulWidget {
  @override
  _AnimalChatAppState createState() => _AnimalChatAppState();
}

class _AnimalChatAppState extends State<AnimalChatApp> {
  bool isDarkMode = false;
  int selectedMinAge = 20; // 설정 최소 나이 불러오기
  int selectedMaxAge = 40; // 설정 최대 나이 불러오기
  double _height = 0.0;
  double _width = 0.0;

  @override
  Widget build(BuildContext context) {
    // 화면 크기 기반 비율 계산
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return MaterialApp(
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: isDarkMode ? Colors.black : Colors.white,
      ),
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF9F86C0).withOpacity(0.25),
          flexibleSpace: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '동물 ',
                    style: TextStyle(
                      color: Color(0xFFBE95C4),
                      fontSize: _width * 0.15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '챗',
                    style: TextStyle(
                      color: Color(0xFFE0B1CB),
                      fontSize: _width * 0.11,
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
              SizedBox(height: _height * 0.05),
              // 좋아하는 동물
              Container(
                padding: EdgeInsets.symmetric(horizontal: _width*0.03, vertical: _height*0.006),
                decoration: BoxDecoration(
                  color: Color(0xFF5E548E), // 박스 배경색
                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                ),
                child: Text(
                  '좋아하는 동물',
                  style: TextStyle(
                    fontSize: _width * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 텍스트 색상 (가독성 위해 흰색)
                  ),
                ),
              ),
              SizedBox(height: _height * 0.045),
              // INFJ
              Container(
                padding: EdgeInsets.symmetric(horizontal: _width*0.03, vertical: _height*0.004),
                decoration: BoxDecoration(
                  color: Color(0xFFBE95C4), // 박스 배경색
                  borderRadius: BorderRadius.circular(8), // 둥근 모서리
                ),
                child: Text(
                  'INFJ',
                  style: TextStyle(
                    fontSize: _width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // 텍스트 색상 (가독성 위해 흰색)
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.06,
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
              SizedBox(height: _height * 0.07),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,  // 한 줄에 3개의 항목
                  crossAxisSpacing: 16,  // 항목들 간의 가로 간격
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
    return Builder(
      builder: (context) {
        return Material(
          color: Color(0xFF9F86C0),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {
              if (label == '메세지 보내기') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SendPage()),
                );
              }
              else if (label == '받은 메세지') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceivePage()),
                );
              }

            },
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.black.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: _width * 0.09, color: Colors.white),
                SizedBox(height: _height * 0.01),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
