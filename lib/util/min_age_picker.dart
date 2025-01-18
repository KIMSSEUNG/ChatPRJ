import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinAgePicker extends StatefulWidget {
  final int minimumAge;
  final int maximumAge;

  MinAgePicker({required this.minimumAge, required this.maximumAge});

  @override
  _MinAgePickerState createState() => _MinAgePickerState();
}

class _MinAgePickerState extends State<MinAgePicker> {
  bool isVisible = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 화면 너비와 높이를 변수로 정의
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
            '최소 나이: ${widget.minimumAge + selectedIndex}',
            style: TextStyle(
              fontSize: screenWidth * 0.047, // 화면 너비의 4.7%를 텍스트 크기로 설정
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.005), // 화면 높이의 0.5% 여백 추가
          Container(
            padding: EdgeInsets.all(screenWidth * 0.02), // 화면 너비의 2% 패딩
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent, // 배경색 설정
              borderRadius: BorderRadius.circular(screenWidth * 0.04), // 화면 너비의 4% 반경
            ),
            child: Text(
              '${widget.minimumAge + selectedIndex}',
              style: TextStyle(
                fontSize: screenWidth * 0.085, // 화면 너비의 9% 텍스트 크기
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
          : Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.045, // 화면 너비의 7% 패딩
          bottom: screenHeight * 0.01, // 화면 높이의 1.3% 패딩
        ),
        child: buildPicker(
          startValue: widget.minimumAge,
          itemCount: widget.maximumAge - widget.minimumAge + 1,
          selectedIndex: selectedIndex,
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget buildPicker({
    required int startValue,
    required int itemCount,
    required int selectedIndex,
    required ValueChanged<int> onIndexChanged,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.22, // 화면 너비의 18% 높이 설정
      width: screenWidth * 0.22, // 화면 너비의 18% 너비 설정
      child: CupertinoPicker(
        itemExtent: screenWidth * 0.08, // 화면 너비의 8%를 아이템 높이로 설정
        backgroundColor: Colors.red,
        onSelectedItemChanged: onIndexChanged,
        children: List.generate(itemCount, (index) {
          return Center(
            child: Text(
              (startValue + index).toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.07, // 화면 너비의 4% 텍스트 크기
              ),
            ),
          );
        }),
      ),
    );
  }
}
