import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaxAgePicker extends StatefulWidget {
  final int minimumAge;
  final int maximumAge;

  MaxAgePicker({required this.minimumAge, required this.maximumAge});

  @override
  _MaxAgePickerState createState() => _MaxAgePickerState();
}

class _MaxAgePickerState extends State<MaxAgePicker> {
  bool isVisible = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Container(
            padding: const EdgeInsets.all(8.0), // 원하는 내부 여백 설정
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent, // 배경색 설정
              borderRadius: BorderRadius.circular(15.0), // 둥근 모서리
            ),
            child: Text(
              '${widget.maximumAge - selectedIndex}',
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )
          : Padding(
        padding: const EdgeInsets.only(right: 13.0, bottom: 5), // 원하는 여백 설정
        child: buildPicker(
          startValue: widget.maximumAge,
          itemCount: widget.maximumAge - widget.minimumAge + 1,
          selectedIndex: selectedIndex,
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
    required ValueChanged<int> onIndexChanged,
    bool isDescending = false,
  }) {
    return Container(
      height: 70,
      width: 70,
      child: CupertinoPicker(
        itemExtent: 30,
        backgroundColor: Colors.blue,
        onSelectedItemChanged: onIndexChanged,
        children: List.generate(itemCount, (index) {
          int value = isDescending ? startValue - index : startValue + index;
          return Center(
            child: Text(
              value.toString(),
              style: TextStyle(color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}
