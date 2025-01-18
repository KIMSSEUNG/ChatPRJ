import 'package:flutter/material.dart';
import 'min_age_picker.dart';
import 'max_age_picker.dart';

class AgeSelector extends StatelessWidget {
  final int minimumAge = 20;
  final int maximumAge = 40;

  @override
  Widget build(BuildContext context) {
    // 화면 너비와 높이 가져오기
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double maxHeight = screenHeight * 0.145;

    return Container(
      child: Column(
        children: [
          Container(
            width: screenWidth, // 화면 너비에 맞춤
            height: maxHeight, // 화면 높이의 14.5%로 높이 설정
            decoration: BoxDecoration(
              color: Color(0xFF9f86c0),
              borderRadius: BorderRadius.circular(screenWidth * 0.04), // 화면 너비의 4% 라디우스
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.12, // 화면 너비의 12% 왼쪽 패딩
                    top: screenHeight * 0.02, // 화면 높이의 2% 위쪽 패딩
                  ),
                  child: MinAgePicker(
                    minimumAge: minimumAge,
                    maximumAge: maximumAge,
                    parentHeight: maxHeight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.12, // 화면 너비의 12% 오른쪽 패딩
                    top: screenHeight * 0.02, // 화면 높이의 2% 위쪽 패딩
                  ),
                  child: MaxAgePicker(
                    minimumAge: minimumAge,
                    maximumAge: maximumAge,
                    parentHeight: maxHeight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
