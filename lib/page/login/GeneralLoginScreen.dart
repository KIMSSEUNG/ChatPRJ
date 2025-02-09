import 'package:flutter/material.dart';

class GeneralLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF2E9E4),
      body: Column(
        children: [
          // "로그인" 타이틀을 별도로 설정해 아래와 독립적이게 만듦
          SizedBox(height: screenHeight * 0.08),
          Center(
            child: Container(
              width: screenWidth * 0.9,  // 화면 너비의 80%
              height: screenHeight * 0.1,  // 화면 높이의 15%
              decoration: BoxDecoration(
                color: Color(0xFFBE95C4),
                borderRadius: BorderRadius.circular(16),  // 모든 모서리를 둥글게 설정
              ),
              alignment: Alignment.center,
              child: Text(
                "로그인",
                style: TextStyle(
                  fontSize: screenWidth * 0.08,  // 반응형 폰트 크기
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.1), // 헤더와 입력 필드 사이 여백

          // ID 입력 필드
          _buildInputField(
            context,
            screenWidth: screenWidth,
            labelText: "ID",
            isPassword: false,
          ),
          SizedBox(height: screenHeight * 0.02), // 입력 필드 간 간격

          // PW 입력 필드
          _buildInputField(
            context,
            screenWidth: screenWidth,
            labelText: "PW",
            isPassword: true,
          ),

          SizedBox(height: screenHeight * 0.2),  // 입력 필드와 버튼 사이 여백

          // 입력 버튼
          SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.07,
            child: ElevatedButton(
              onPressed: () => print("로그인 시도"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBE95C4),
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
            ),
          ),
        ],
      ),
    );
  }

  // 입력 필드 위젯
  Widget _buildInputField(BuildContext context, {
    required double screenWidth,
    required String labelText,
    required bool isPassword,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Row(
        children: [
          // 레이블
          Container(
            width: screenWidth * 0.17,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              color: Color(0xFFBE95C4),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              "$labelText :",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(width: screenWidth * 0.05), // 레이블과 텍스트 필드 간 간격

          // 입력 필드
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                color: Color(0xFFD3D3D3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                obscureText: isPassword,  // 비밀번호 필드 여부에 따라 설정
                style: TextStyle(
                  fontSize: screenWidth * 0.04,  // 입력값의 글씨 크기 설정 (원하는 비율로 조정 가능)
                  fontWeight: FontWeight.bold,  // 선택: 굵은 글씨
                  color: Colors.black,  // 선택: 입력값 색상
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),  // 수직 패딩 추가
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
