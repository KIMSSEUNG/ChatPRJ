import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeSelector extends StatefulWidget {
  //final Function(int , int) onAgeChanged; // 최소 나이, 최대 나이 모두 전달
  //final int selectedMinAge;
  //final int selectedMaxAge;

  //AgeSelector({
    //required this.selectedMinAge,
    //required this.selectedMaxAge,
    //required this.onAgeChanged
  //});

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  int minIndex=0;
  int selectMinAge = 0;

  int maxIndex=0;
  int selectMaxAge = 0;

  //나이 범위 설정
  int minimumAge=20;
  int maximumAge=40;
  int range = 0;

  //picker visible
  bool isMiniVisible = false;
  bool isMaxVisible = false;

  @override
  void initState() {
    // selectedMinAge = widget.selectedMinAge;
    // selectedMaxAge = widget.selectedMaxAge;
    // 초기 저장된 설정값 사용
    minIndex = 0;
    selectMinAge = minIndex+minimumAge;
    maxIndex = 0;
    selectMaxAge = maximumAge-maxIndex;
    range = maximumAge - minimumAge;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height : 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 정렬
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMiniVisible = true; // 클릭 시 컨테이너의 visibility 변경
                      });
                      Future.delayed(Duration(seconds: 6), () {
                      setState(() {
                          isMiniVisible = false;  // 3초 후 텍스트 숨기기
                        });
                      });
                    },
                    child: !isMiniVisible
                      ? Padding(
                          padding: const EdgeInsets.only(left: 70.0), // 텍스트를 왼쪽으로 끌어옴
                          child: Text(
                            '클릭1',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        )
                        : Column(
                              children : [
                              Text(
                                '최소 나이: $selectMinAge',
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Container(
                                height: 40,  // 피커의 전체 높이를 설정
                                width: 60,
                                padding: const EdgeInsets.only(left: 30.0),
                                // 최소 나이 Picker
                                child: CupertinoPicker(
                                  itemExtent: 30,
                                  backgroundColor: Colors.red,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      minIndex=index;
                                      selectMinAge = minIndex+minimumAge;
                                    });
                                    //widget.onAgeChanged(selectedMinAge , 40);
                                  },
                                  children: List.generate(range-maxIndex, (index) {
                                    return Center(
                                      child: Text(
                                        (minimumAge + index).toString(),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }),
                                )
                            ) ],
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMaxVisible = true; // 클릭 시 컨테이너의 visibility 변경
                      });
                      Future.delayed(Duration(seconds: 6), () {
                        setState(() {
                          isMaxVisible = false;  // 3초 후 텍스트 숨기기
                        });
                      });
                    },
                    child: !isMaxVisible
                        ? Padding(
                            padding: const EdgeInsets.only(right: 70.0), // 텍스트를 왼쪽으로 끌어옴
                            child: Text(
                              '클릭1',
                              style: TextStyle(fontSize: 20, color: Colors.blue),
                            ),
                        )
                        : Column(
                            children : [
                              Column(
                                children : [
                                  Text(
                                    '최대 나이: $selectMaxAge',
                                    style: TextStyle(fontSize: 15, color: Colors.black),
                                  ),
                                  Container(
                                      height: 40,  // 피커의 전체 높이를 설정
                                      width: 60,
                                      child: CupertinoPicker(
                                        itemExtent: 30,
                                        backgroundColor: Colors.blue,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            maxIndex =  index;
                                            selectMaxAge = maximumAge-maxIndex;
                                          });
                                          //widget.onAgeChanged(selectedMinAge , 40);
                                        },
                                        children: List.generate(range-minIndex, (index) {
                                          return Center(
                                            child: Text(
                                              (maximumAge - index).toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }),
                                      )
                                  ) ],
                              ) ],
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}