import 'package:flutter/material.dart';


class ReceivePage extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<ReceivePage> {
  // 더미 데이터 (DB에서 받아오는 형태로 가정)
  List<Map<String, String>> messages = [
    {'info': '고양이 / INFJ / 남성 / 25', 'latest': '안녕하세요!'},
    {'info': '강아지 / ENFP / 여성 / 30', 'latest': '좋은 하루 되세요! 좋은 하루 되세요! 좋은 하루 되세요! 좋은 하루 되세요! 좋은 하루 되세요!'},
    {'info': '토끼 / INTJ / 남성 / 27', 'latest': '반갑습니다.'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
    {'info': '펭귄 / ISTP / 여성 / 22', 'latest': '오랜만이에요!'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth * 0.9, // 전체 화면의 90%
          height: screenHeight * 0.9, // 전체 화면의 90%
          decoration: BoxDecoration(
            color: Color(0xFF9F86C0),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(screenWidth * 0.037),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessageBox(screenWidth, screenHeight, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBox(double screenWidth, double screenHeight, int index) {
    // 최신 메시지 길이 체크 및 문자열 자르기
    String latestMessage = messages[index]['latest']!;
    if (latestMessage.length > 19) {
      latestMessage = '${latestMessage.substring(0, 19)}...';
    }

    return Container(
      width: screenWidth * 0.84, // 부모(90%) 대비 15% 여백 제외
      margin: EdgeInsets.only(bottom: screenHeight * 0.02), // 항목 간 간격
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Color(0xFFE0B1CB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 동물 / MBTI / 성별 / 나이 + 삭제 버튼 (부모 대비 15% 높이 중 30%)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                messages[index]['info']!,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    messages.removeAt(index);
                  });
                },
                child: Icon(
                  Icons.delete_forever, // 삭제 아이콘
                  color: Colors.white,
                  size: screenWidth * 0.07,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),

          // 가장 최신 메시지 (부모 대비 15% 높이 중 50%)
          Text(
            latestMessage,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.white,
            ),
            maxLines: 1,  // 한 줄로 표시
            overflow: TextOverflow.ellipsis,  // 넘칠 경우 ... 표시
          ),
        ],
      ),
    );
  }
}
