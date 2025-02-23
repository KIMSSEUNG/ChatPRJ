import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MemberSettingsScreen(),
  ));
}

class MemberSettingsScreen extends StatefulWidget {
  @override
  _MemberSettingsScreenState createState() => _MemberSettingsScreenState();
}

class _MemberSettingsScreenState extends State<MemberSettingsScreen> {
  String selectedAnimal = "고양이";
  String selectedAnimalIcon = "🐱";
  int selectedAge = 28;
  bool isMale = true;

  // MBTI 선택값
  String mbti1 = "E";
  String mbti2 = "N";
  String mbti3 = "F";
  String mbti4 = "J";

  final List<Map<String, String>> animals = [
    {"name": "고양이", "icon": "🐱"},
    {"name": "강아지", "icon": "🐶"},
    {"name": "토끼", "icon": "🐰"},
    {"name": "판다", "icon": "🐼"},
    {"name": "사자", "icon": "🦁"},
    {"name": "호랑이", "icon": "🐯"},
    {"name": "코끼리", "icon": "🐘"},
    {"name": "원숭이", "icon": "🐵"},
    {"name": "여우", "icon": "🦊"},
    {"name": "곰", "icon": "🐻"},
    {"name": "돼지", "icon": "🐷"},
    {"name": "펭귄", "icon": "🐧"},
    {"name": "햄스터", "icon": "🐹"},
    {"name": "양", "icon": "🐑"},
    {"name": "말", "icon": "🐴"},
    {"name": "소", "icon": "🐮"},
    {"name": "거북이", "icon": "🐢"},
    {"name": "물고기", "icon": "🐟"},
    {"name": "문어", "icon": "🐙"},
    {"name": "돌고래", "icon": "🐬"},
  ];

  void _selectMBTI(int index, String currentValue) {
    List<String> options;
    if (index == 0) options = ["E", "I"];
    else if (index == 1) options = ["N", "S"];
    else if (index == 2) options = ["F", "T"];
    else options = ["J", "P"];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("MBTI 선택"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    if (index == 0) mbti1 = option;
                    else if (index == 1) mbti2 = option;
                    else if (index == 2) mbti3 = option;
                    else mbti4 = option;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _selectAnimal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("좋아하는 동물 선택"),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: animals.map((animal) {
                  return ListTile(
                    leading: Text(animal["icon"]!, style: TextStyle(fontSize: 24)),
                    title: Text(animal["name"]!),
                    onTap: () {
                      setState(() {
                        selectedAnimal = animal["name"]!;
                        selectedAnimalIcon = animal["icon"]!;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectAge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("나이 선택"),
          content: SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(21, (index) => 20 + index).map((age) {
                  return ListTile(
                    title: Text("$age"),
                    onTap: () {
                      setState(() {
                        selectedAge = age;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF2E9E4),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,  // 왼쪽 정렬
              margin: EdgeInsets.only(left: screenWidth * 0.02,top: screenHeight * 0.03 , right: screenWidth * 0.52),  // 왼쪽 여백 추가 (5%)
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: screenWidth * 0.06), // 내부 여백
              decoration: BoxDecoration(
                color: Color(0xFFCDB4DB),  // 💜 원하는 배경색 (연한 보라색)
                borderRadius: BorderRadius.circular(25),  // 📏 모서리를 둥글게 (12px)
              ),
              child: Text(
                "회원설정",
                style: TextStyle(
                    fontSize: screenWidth * 0.063,  // 반응형 크기
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.003),

            _buildSectionTitle("MBTI 선택", screenWidth, screenHeight),
            _buildSectionBackGround( screenWidth ,screenHeight , 0.1 ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMBTIButton(0, mbti1, screenWidth , screenHeight),
                  SizedBox(width: screenWidth * 0.03 , ),
                  _buildMBTIButton(1, mbti2, screenWidth , screenHeight),
                  SizedBox(width: screenWidth * 0.03),
                  _buildMBTIButton(2, mbti3, screenWidth , screenHeight),
                  SizedBox(width: screenWidth * 0.03),
                  _buildMBTIButton(3, mbti4, screenWidth , screenHeight),
                ],
              )
            ),

            SizedBox(height: screenHeight*0.01),
            _buildSectionTitle("좋아하는 동물", screenWidth, screenHeight),
            _buildSectionBackGround( screenWidth ,screenHeight, 0.1 , Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedAnimalIcon, style: TextStyle(fontSize: screenWidth * 0.1 , fontWeight: FontWeight.bold)),
                  SizedBox(width: screenWidth * 0.16),
                  _buildAnimalSelectButton(selectedAnimal , screenWidth , screenHeight),
                ],
              ),
            ),

            SizedBox(height: screenHeight*0.01),
            // ✨ "세부 설정" 그룹 추가
            _buildSectionTitle("세부 설정", screenWidth, screenHeight),
            _buildSectionBackGround( screenWidth ,screenHeight, 0.14, Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🔹 나이 선택 버튼
                  _buildAgeSelectButton(screenWidth,screenHeight),
                  SizedBox(width: screenWidth * 0.09), // 🔹 나이 선택과 성별 선택 사이 여백
                  // 🔹 성별 선택 버튼
                  _buildGenderSelectButton(screenWidth,screenHeight),
                ],
              ),
             ),

            SizedBox(height: screenHeight*0.05),
            _buildInputSelectButton(screenWidth, screenHeight)
          ],
        ),
      ),
    );
  }

  Widget _buildMBTIButton(int index, String value, double screenWidth , double screenHeight) {
    return ElevatedButton(
      onPressed: () => _selectMBTI(index, value),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth * 0.15, screenHeight * 0.02),  // 📏 버튼 크기 조정 (가로, 세로)
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // 내부 패딩
        backgroundColor: Color(0xFFAF6EC5)
      ),
      child: Text(value, style:
        TextStyle(fontSize: screenWidth * 0.06 , fontWeight: FontWeight.bold ,color: Colors.white)
      ),
    );
  }

  Widget _buildSectionBackGround(
    double screenWidth,
    double screenHeight,
    double height ,
    Widget child,
    ) {
    return Container(
      width: screenWidth * 0.85,  // 🔹 가로 크기 고정 (90% 너비)
      height: screenHeight * height,  // 🔹 세로 크기 고정 (15% 높이)
      margin: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.03),
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7), // 💜 연한 보라색
        borderRadius: BorderRadius.circular(15),
      ),
      child: child, // 내부에 Row, Column 등을 넣을 수 있도록 수정!
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.4,  // 🔹 가로 크기 고정 (40% 너비)
      height: screenHeight * 0.06,  // 🔹 세로 크기 고정 (6% 높이)
      margin: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.015, right: screenWidth * 0.48),
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.013, horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(color: Color(0xFFE1CCED), borderRadius: BorderRadius.circular(15)),
      child: Text(title, style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.white)
       , textAlign: TextAlign.center),

    );
  }



  Widget _buildAnimalSelectButton(String selectedAnimal, double screenWidth , double screenHeight){
    return ElevatedButton(
        onPressed: _selectAnimal ,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(screenWidth * 0.4, screenHeight * 0.02),  // 📏 버튼 크기 조정 (가로, 세로)
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.013), // 내부 패딩
            backgroundColor: Color(0xFFD49DE7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // 📏 🔥 모서리 둥글기 조정 (8px)
            )
        ),
        child : Text(selectedAnimal, style:
          TextStyle(fontSize: screenWidth * 0.05 , fontWeight: FontWeight.bold ,color: Colors.white)
        )
    );
  }

  //나이 설정 텍스트와 버튼
  Widget _buildAgeSelectButton( double screenWidth , double screenHeight){
      return Column(
        children: [
          Text("나이", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ElevatedButton(onPressed: _selectAge,
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.15, screenHeight * 0.013),  // 📏 버튼 크기 조정 (가로, 세로)
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // 내부 패딩
                  backgroundColor: Color(0xFFAF6EC5)
              ),
              child: Text("$selectedAge" ,
              style: TextStyle(fontSize: screenWidth * 0.055 , fontWeight: FontWeight.bold ,color: Colors.white),
            ),
          ),
        ],
      );
  }
  //

  //성별 설정 텍스트와 버튼
  Widget _buildGenderSelectButton( double screenWidth , double screenHeight){
    return Column(
      children: [
        Text("성별", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          children: [
            _buildGenderButton("남", true, screenWidth, screenHeight),
            SizedBox(width: screenWidth * 0.08),
            _buildGenderButton("여", false, screenWidth, screenHeight),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String text, bool isMaleButton, double screenWidth , double screenHeight) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isMale = isMaleButton;
        });
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(screenWidth * 0.15, screenHeight * 0.013),  // 📏 버튼 크기 조정 (가로, 세로)
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // 내부 패딩
          backgroundColor: _getGenderButtonColor(isMaleButton)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.055,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getGenderButtonColor(bool isMaleButton) {
    if (isMaleButton) {
      return isMale ? Colors.blue : Colors.grey;  // 남성 선택 시 파란색, 미선택 시 회색
    } else {
      return isMale ? Colors.grey : Colors.pink;  // 여성 선택 시 분홍색, 미선택 시 회색
    }
  }

  Widget _buildInputSelectButton(double screenWidth , double screenHeight){
    return ElevatedButton(
      onPressed: () => print("입력 완료"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFBE95C4),
        minimumSize: Size(screenWidth * 0.4, screenHeight * 0.013),  // 📏 버튼 크기 조정 (가로, 세로)
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.013), // 내부 패딩
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "입력",
        style: TextStyle(
          fontSize: screenWidth * 0.05,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  //
}
