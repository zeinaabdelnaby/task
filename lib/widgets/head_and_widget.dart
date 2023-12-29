import 'package:flutter/material.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/widgets/vertical_scroll.dart';

class HeadAndWidget extends StatelessWidget {
  const HeadAndWidget({super.key, required this.title, required this.homePageModel});
  final String title;
  final HomePageModel homePageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          width: 70,
          child: Divider(
            thickness: 1,
            color: kDividerColor,
          ),
        ),
        VerticalScrollItems(homePageModel: homePageModel)
      ],
    );
  }
}
