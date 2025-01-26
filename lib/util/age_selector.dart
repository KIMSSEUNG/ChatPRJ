import 'package:animal_project/util/FileHandler.dart';
import 'package:flutter/material.dart';
import 'min_age_picker.dart';
import 'max_age_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AgeSelector extends StatefulWidget {
  final int minimumAge = 20;
  final int maximumAge = 40;

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> with WidgetsBindingObserver {
  int minStorageIndex = 0;
  int maxStorageIndex = 0;


  @override
  void initState() {
    super.initState();
    // 라이프 사이클 상태 변경 감지를 위해 WidgetsBindingObserver 등록
    WidgetsBinding.instance.addObserver(this);
    // 앱이 시작될 때 데이터를 불러오기
    String? max =  FileHandler.instance.getValue("maxIndex");
    String? min =  FileHandler.instance.getValue("minIndex");
    print("$max $min");
    minStorageIndex = min!=null?int.parse(min):0;
    maxStorageIndex = max!=null?int.parse(max):0;
    // 불러온 min Index가 이상할 경우 기본값으로 초기화
    if(minStorageIndex<0 || minStorageIndex>20 ){
      minStorageIndex = 0;
    }
    // 불러온 min Index가 이상할 경우 기본값으로 초기화
    if(maxStorageIndex<0 || maxStorageIndex>20 ){
        maxStorageIndex = 0;
    }

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// 생명주기 상태 변경 감지
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // 앱이 백그라운드로 갈 때 혹은 종료될 때 데이터를 저장
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      FileHandler.instance.saveData("maxIndex", maxStorageIndex.toString());
      FileHandler.instance.saveData("minIndex", minStorageIndex.toString());
      print("SAVE DATA");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double maxHeight = screenHeight * 0.145;
    return Container(
      child: Column(
        children: [
          Container(
            width: screenWidth,
            height: maxHeight,
            decoration: BoxDecoration(
              color: Color(0xFF9f86c0),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.12,
                    top: screenHeight * 0.02,
                  ),
                  child: MinAgePicker(
                    minimumAge: widget.minimumAge,
                    maximumAge: widget.maximumAge,
                    parentHeight: maxHeight,
                    maxStorageIndex: maxStorageIndex,
                    onIndexChanged: (index) {
                      setState(() {
                        minStorageIndex = index;
                      });
                    },
                    minIndex:minStorageIndex,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.12,
                    top: screenHeight * 0.02,
                  ),
                  child: MaxAgePicker(
                    minimumAge: widget.minimumAge,
                    maximumAge: widget.maximumAge,
                    parentHeight: maxHeight,
                    minStorageIndex: minStorageIndex,
                    onIndexChanged: (index) {
                      setState(() {
                        maxStorageIndex = index;
                      });
                    },
                    maxIndex:maxStorageIndex,
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
