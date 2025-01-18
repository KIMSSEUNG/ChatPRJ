import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaxAgePicker extends StatefulWidget {
  final int minimumAge;
  final int maximumAge;
  final double parentHeight;

  MaxAgePicker({required this.minimumAge, required this.maximumAge , required this.parentHeight});

  @override
  _MaxAgePickerState createState() => _MaxAgePickerState();
}

class _MaxAgePickerState extends State<MaxAgePicker> {
  bool isVisible = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 화면 너비와 높이 변수 설정
    double screenWidth =  MediaQuery.of(context).size.width;
    double screenHeight = widget.parentHeight;

    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = true;
        });
        Future.delayed(Duration(seconds: 6), () {
          setState(() {
            isVisible = false;
          });
        });
      },
      child: !isVisible
          ? Column(
        children: [
          Text(
            '최대 나이: ${widget.maximumAge - selectedIndex}',
            style: TextStyle(
              fontSize: screenHeight * 0.17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.03), // 화면 높이의 0.5% 여백 추가
          Container(
            padding: EdgeInsets.all(screenWidth * 0.02), // 화면 너비의 2% 내부 여백
            decoration: BoxDecoration(
              color: Color(0xFF5e548e), // 배경색 설정
              borderRadius: BorderRadius.circular(screenWidth * 0.04), // 화면 너비의 4% 둥근 모서리
            ),
            child: Text(
              '${widget.maximumAge - selectedIndex}',
              style: TextStyle(
                fontSize: screenHeight * 0.2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
          : Padding(
        padding: EdgeInsets.only(
          right: screenWidth * 0.05, // 화면 너비의 5.5% 오른쪽 패딩
          bottom: screenHeight * 0.008, // 화면 높이의 1% 아래 패딩
        ),
        child: buildPicker(
          startValue: widget.maximumAge,
          itemCount: widget.maximumAge - widget.minimumAge + 1,
          selectedIndex: selectedIndex,
          screenHeight: screenHeight,
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          isDescending: true,
        ),
      ),
    );
  }

  Widget buildPicker({
    required int startValue,
    required int itemCount,
    required int selectedIndex,
    required double screenHeight,
    required ValueChanged<int> onIndexChanged,
    bool isDescending = false,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.7, // 화면 너비의 18% 높이 설정
      width: screenWidth * 0.22, // 화면 너비의 18% 너비 설정
      child: CupertinoPicker(
        itemExtent: screenWidth * 0.12, // 화면 너비의 8%를 아이템 높이로 설정
        backgroundColor: Colors.transparent, // Picker 배경을 투명하게 설정
        onSelectedItemChanged: onIndexChanged,
        children: List.generate(itemCount, (index) {
          int value = isDescending ? startValue - index : startValue + index;
          return Center(
            child: Text(
              value.toString(),
              style: TextStyle(
                color: Colors.black,
                  fontSize: screenHeight * 0.23,
                fontWeight: FontWeight.bold
              ),
            ),
          );
        }),
      ),
    );
  }
}
