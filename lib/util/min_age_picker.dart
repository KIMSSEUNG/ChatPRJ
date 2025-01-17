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
                    style: TextStyle(fontSize: 16, color: Colors.white ,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding: const EdgeInsets.all(8.0), // 원하는 내부 여백 설정
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, // 배경색 설정
                      borderRadius: BorderRadius.circular(15.0), // 둥근 모서리
                    ),
                    child: Text(
                      '${widget.minimumAge + selectedIndex}',
                      style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
                    ),
                  )
                ]
            )
          :
            Padding(
              padding: const EdgeInsets.only(left: 10.0 , bottom: 5), // 원하는 여백 설정
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
            )
    );
  }

  Widget buildPicker({
    required int startValue,
    required int itemCount,
    required int selectedIndex,
    required ValueChanged<int> onIndexChanged,
  }) {
    return Container(
      height: 70,
      width: 70,
      child: CupertinoPicker(
        itemExtent: 30,
        backgroundColor: Colors.red,
        onSelectedItemChanged: onIndexChanged,
        children: List.generate(itemCount, (index) {
          return Center(
            child: Text(
              (startValue + index).toString(),
              style: TextStyle(color: Colors.black),
            ),
          );
        }),
      ),
    );
  }
}
