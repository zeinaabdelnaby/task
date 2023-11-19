import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/monthes_model.dart';

class VerticalScrollItems extends StatelessWidget {
  VerticalScrollItems(
      {super.key, required this.monthes, this.colory = KSecondaryColor});

  final MonthesModel monthes;
  final Color colory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: monthes.content.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colory,
              ),
              child: Card(
                elevation: 0,
                color: colory,
                child: Container(
                  height: 40,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          monthes.content[index].name,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        Text(
                          monthes.content[index].time,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
