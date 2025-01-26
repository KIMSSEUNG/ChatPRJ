import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  bool isMale = true; // 토글 상태

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // 동적 패딩 (5%)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 성별 선택 토글 (15% 높이)
            Container(
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                color: Color(0xFFBE95C4),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 내부 패딩 조정
              child: Stack(
                children: [
                  // 애니메이션 배경 (왼쪽 -> 오른쪽, 오른쪽 -> 왼쪽)
                  AnimatedAlign(
                    alignment: isMale ? Alignment.centerLeft : Alignment.centerRight,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      width: screenWidth * 0.40, // 부모의 40% 차지
                      height: screenHeight * 0.15 * 0.70,
                      decoration: BoxDecoration(
                        color: isMale ? Color(0xFF9F86C0) : Color(0xFFE0B1CB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => isMale = true);
                        },
                        child: Container(
                          width: screenWidth * 0.40,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: screenHeight * 0.06, color: isMale ? Colors.blue : Colors.black),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                "남성",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: isMale ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() => isMale = false);
                        },
                        child: Container(
                          width: screenWidth * 0.40,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, size: screenHeight * 0.06, color: !isMale ? Colors.pink : Colors.black),
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                "여성",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: !isMale ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // 여백 조정

            // 텍스트 입력 영역 (50% 높이)
            Container(
              height: screenHeight * 0.50,
              decoration: BoxDecoration(
                color: Color(0xFF9F86C0),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(screenWidth * 0.04), // 동적 패딩 (4%)
              child: TextField(
                maxLines: null, // 여러 줄 입력 가능
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "입력하세요...",
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // 여백 조정

            // 보내기 버튼 (10% 높이)
            SizedBox(
              height: screenHeight * 0.10,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 동작할 코드 추가
                  print("보내기 버튼 클릭됨!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200], // 버튼 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                  ),
                ),
                child: Text(
                  "보내기",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.10 * 0.30, // 부모 대비 30% 크기
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
