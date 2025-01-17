import 'package:flutter/material.dart';
import 'min_age_picker.dart';
import 'max_age_picker.dart';

class AgeSelector extends StatelessWidget {
  final int minimumAge = 20;
  final int maximumAge = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 50.0 , top: 15 ),
                    child:
                      MinAgePicker(minimumAge: minimumAge, maximumAge: maximumAge)
                )
                ,
                Padding(
                  padding: const EdgeInsets.only(right: 50.0 , top: 15),
                  child:
                    MaxAgePicker(minimumAge: minimumAge, maximumAge: maximumAge),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
