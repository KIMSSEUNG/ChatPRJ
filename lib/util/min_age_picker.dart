import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinAgePicker extends StatefulWidget {
  final int minimumAge;
  final int maximumAge;
  final double parentHeight;
  final int maxStorageIndex;
  final ValueChanged<int> onIndexChanged;

  MinAgePicker(
      {required this.minimumAge,
        required this.maximumAge,
        required this.parentHeight,
        required this.maxStorageIndex,
        required this.onIndexChanged,
      });

  @override
  _MinAgePickerState createState() => _MinAgePickerState();
}

class _MinAgePickerState extends State<MinAgePicker> {
  bool isVisible = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0; // 부모로부터 전달된 초기 minIndex로 설정
  }

  @override
  Widget build(BuildContext context) {
    // 화면 너비와 높이를 변수로 정의
    double screenWidth = MediaQuery.of(context).size.width;
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
            '최소 나이: ${widget.minimumAge + selectedIndex}',
            style: TextStyle(
              fontSize: screenHeight * 0.17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.03), // 화면 높이의 0.5% 여백 추가
          Container(
            padding: EdgeInsets.all(screenWidth * 0.02), // 화면 너비의 2% 패딩
            decoration: BoxDecoration(
              color: Color(0xFF5e548e), // 배경색 설정
              borderRadius: BorderRadius.circular(screenWidth * 0.04), // 화면 너비의 4% 반경
            ),
            child: Text(
              '${widget.minimumAge + selectedIndex}',
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
          left: screenWidth * 0.045, // 화면 너비의 7% 패딩
          bottom: screenHeight * 0.01, // 화면 높이의 1.3% 패딩
        ),
        child: buildPicker(
          startValue: widget.minimumAge,
          itemCount: widget.maximumAge - widget.minimumAge + 1,
          selectedIndex: selectedIndex,
          screenHeight: screenHeight,
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
            widget.onIndexChanged(index); // 부모로 index 전달
          },
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
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.7, // 화면 너비의 18% 높이 설정
      width: screenWidth * 0.22, // 화면 너비의 18% 너비 설정
      child: CupertinoPicker(
        itemExtent: screenWidth * 0.12, // 화면 너비의 8%를 아이템 높이로 설정
        backgroundColor: Colors.transparent, // Picker 배경을 투명하게 설정
        onSelectedItemChanged: onIndexChanged,
        scrollController: FixedExtentScrollController(initialItem: selectedIndex), // 초기 선택 인덱스 설정
        children: List.generate(20-widget.maxStorageIndex, (index) {
          return Center(
            child: Text(
              (startValue + index).toString(),
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
