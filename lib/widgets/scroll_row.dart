import 'package:flutter/material.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/widgets/vertical_scroll.dart';

class ScrollRow extends StatelessWidget {
  ScrollRow(
      {super.key,
      required this.homePageModel,
      required this.index,
      required this.selectedIndex,
      required this.onSelectedChanged,
     });

  final HomePageModel homePageModel;
  final int index;
  final int selectedIndex;
  final void Function(int? value) onSelectedChanged;

  @override
  Widget build(BuildContext context) {
    // int selectedOption = 0;

    return Column(children: [
      Row(
        children: [
          Radio(
            value: index,
            groupValue: selectedIndex,
            onChanged: onSelectedChanged,
          ),
          Text(
            // homePageInfo.name,
            ("zzzzzzzz"),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
      VerticalScrollItems(
        homePageModel: homePageModel,
      )
    ]);
  }
}
