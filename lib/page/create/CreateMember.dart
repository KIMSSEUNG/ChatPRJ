import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CreateMember(),
  ));
}

class CreateMember extends StatefulWidget {
  @override
  _CreateMemberState createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwConfirmController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? idError;
  String? pwError;
  String? pwConfirmError;
  String? emailError;

  // 가상의 중복 체크 로직 (실제 구현 시 DB나 서버 체크 필요)
  bool _isDuplicateID(String id) {
    return id == "duplicateID";  // 예제에서는 "duplicateID"가 중복된 아이디로 가정
  }

  // 이메일 형식 체크 (간단한 정규식)
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // 입력값 검증 로직
  void _validateInputs() {
    setState(() {
      idError = null;
      pwError = null;
      pwConfirmError = null;
      emailError = null;

      // 1. ID 검증
      if (_idController.text.isEmpty) {
        idError = "값이 없습니다.";
      } else if (_isDuplicateID(_idController.text)) {
        idError = "중복된 아이디가 있습니다.";
      } else if (_idController.text.length < 7) {
        idError = "해당 하는 길이 7자 보다 입력 아이디 길이가 짧습니다.";
      }

      // 2. PW 검증
      if (_pwController.text.isEmpty) {
        pwError = "값이 없습니다.";
      } else if (_pwController.text.length < 7) {
        pwError = "해당 하는 길이 7자 보다 입력 패스워드 길이가 짧습니다.";
      }

      // 3. PW 확인 검증
      if (_pwConfirmController.text.isEmpty) {
        pwConfirmError = "값이 없습니다.";
      } else if (_pwController.text != _pwConfirmController.text) {
        pwConfirmError = "password가 다릅니다.";
      }

      // 4. 이메일 검증
      if (_emailController.text.isEmpty) {
        emailError = "값이 없습니다.";
      } else if (!_isValidEmail(_emailController.text)) {
        emailError = "입력된 이메일 형식이 맞지 않습니다.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF2E9E4),
      body: Column(
        children: [
          // 헤더
          SizedBox(height: screenHeight * 0.08),
          Center(
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                color: Color(0xFFBE95C4),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: Text(
                "회원가입",
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.05),  // 간격

          // 입력 필드들
          _buildInputField(
            screenWidth: screenWidth,
            labelText: "ID",
            isPassword: false,
            controller: _idController,
            errorText: idError,
          ),
          _buildInputField(
            screenWidth: screenWidth,
            labelText: "PW",
            isPassword: true,
            controller: _pwController,
            errorText: pwError,
          ),
          _buildInputField(
            screenWidth: screenWidth,
            labelText: "PW 확인",
            isPassword: true,
            controller: _pwConfirmController,
            errorText: pwConfirmError,
          ),
          _buildInputField(
            screenWidth: screenWidth,
            labelText: "e-mail",
            isPassword: false,
            controller: _emailController,
            errorText: emailError,
          ),

          SizedBox(height: screenHeight * 0.05),  // 간격

          // 입력 버튼
          SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.07,
            child: ElevatedButton(
              onPressed: _validateInputs,
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

  Widget _buildInputField({
    required double screenWidth,
    required String labelText,
    required bool isPassword,
    required TextEditingController controller,
    String? errorText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 레이블
              Container(
                width: screenWidth * 0.20,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFFBE95C4),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  labelText,
                  style: TextStyle(
                    fontSize: screenWidth * 0.043,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),

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
                    controller: controller,
                    obscureText: isPassword,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 오류 메시지 출력
          if (errorText != null) ...[
            SizedBox(height: screenWidth * 0.02),
            Text(
              errorText,
              style: TextStyle(
                color: Colors.red,
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
