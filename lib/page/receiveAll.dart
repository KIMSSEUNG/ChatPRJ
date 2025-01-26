import 'package:flutter/material.dart';


class receiveAll extends StatelessWidget {
  final String message = "안녕하세요. 이 메시지는 자동 줄바꿈 기능이 적용됩니다. 글이 길어지면 자동으로 다음 줄로 이동합니다.";
  final String info;
  final String latestMessage;

  receiveAll({required this.info, required this.latestMessage});


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // 화면 높이
    double screenWidth = MediaQuery.of(context).size.width;   // 화면 너비

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth * 0.9,  // 부모의 90%
          height: screenHeight * 0.9, // 부모의 90%
          decoration: BoxDecoration(
            color: Color(0xFF9F86C0), // 배경색
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),  // 부모 대비 4% 패딩
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 타이틀 바 (부모 대비 8%)
              Container(
                height: screenHeight * 0.9 * 0.08,  // 부모 높이의 8%
                decoration: BoxDecoration(
                  color: Color(0xFFbe95c4),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      info,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // 메시지 영역 (부모 대비 70%)
              Container(
                height: screenHeight * 0.9 * 0.73,  // 부모 높이의 73%
                width: screenWidth * 0.9 * 0.9, // 부모 너비의 90%
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Color(0xFFE0B1CB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(  // 넘칠 경우 스크롤 처리
                  child: Text(
                    latestMessage,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true,  // 자동 줄바꿈 활성화
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // 보내기 및 삭제 버튼 (부모 대비 5%)
              Row(
                children: [
                  // 보내기 버튼 (전체 너비의 49%)
                  Expanded(
                    flex: 49,
                    child: SizedBox(
                      height: screenHeight * 0.9 * 0.08, // 부모 높이의 5%
                      child: ElevatedButton(
                        onPressed: () {
                          print("메시지 보내기 클릭됨!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5e548e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "보내기",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.02),  // 버튼 사이 간격 2%

                  // 삭제 버튼 (전체 너비의 49%)
                  Expanded(
                    flex: 49,
                    child: SizedBox(
                      height: screenHeight * 0.9 * 0.08, // 부모 높이의 5%
                      child: ElevatedButton(
                        onPressed: () {
                          print("삭제 버튼 클릭됨!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "삭제",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}