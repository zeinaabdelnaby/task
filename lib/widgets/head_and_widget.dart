import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/widgets/vertical_scroll.dart';

class HeadAndWidget extends StatelessWidget {
  const HeadAndWidget({super.key, required this.title, required this.monthes});
  final String title;
  final MonthesModel monthes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Container(
          width: 70,
          child: Divider(
            thickness: 1,
            color: KSecondaryColor,
          ),
        ),
        VerticalScrollItems(monthes: monthes)
      ],
    );
  }
}
