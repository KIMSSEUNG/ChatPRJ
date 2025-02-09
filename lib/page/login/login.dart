import 'package:animal_project/page/create/CreateMember.dart';
import 'package:animal_project/util/login/GoogleLoginService.dart';
import 'package:flutter/material.dart';
import 'GeneralLoginScreen.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {};
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF2E9E4),  // 전체 배경색 설정
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

          // 로그인 버튼들 (전체 너비로 설정)
          // 로그인 버튼들
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  buttonColor: Color(0xFFE1CCED),
                  iconPath: 'assets/google_icon.png',
                  buttonText: "구글 로그인",
                  onPressed: () => GoogleLoginService().signIn(),
                ),
                SizedBox(height: screenHeight * 0.04),

                _buildLoginButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  buttonColor: Color(0xFF9F86C0),
                  iconPath: 'assets/login_icon.png',
                  buttonText: "일반 로그인",
                  onPressed: () => Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => GeneralLoginScreen()),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),

                _buildLoginButton(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  buttonColor: Color(0xFF5E548E),
                  iconPath: 'assets/register_icon.png',
                  buttonText: "회원 가입",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateMember()),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 로그인 버튼 위젯
  Widget _buildLoginButton({
    required double screenWidth,
    required double screenHeight,
    required Color buttonColor,
    required String iconPath,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: screenWidth * 0.85,  // 부모 너비의 85%
      height: screenHeight * 0.07,  // 화면 높이의 8%로 비율 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: screenHeight * 0.035,  // 아이콘 크기도 비율로 설정
            ),
            SizedBox(width: screenWidth * 0.02),  // 아이콘과 텍스트 간격
            Text(
              buttonText,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
