import 'package:flutter/material.dart';
import 'package:task/models/monthes_model.dart';

class VerticalScrollItems extends StatelessWidget {
  VerticalScrollItems({super.key, required this.monthes});

  MonthesModel monthes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: Card(
                elevation: 0,
                color: Colors.green,
                child: Container(
                  height: 40,
                  width: 150,
                  child: Column(
                    children: [
                      Text(monthes.content.name[index]),
                      Text(monthes.content.time.toString()[index])
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
