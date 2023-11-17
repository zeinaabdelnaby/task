import 'package:flutter/material.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/widgets/vertical_scroll.dart';

// class ScrollRow extends StatefulWidget {
//    ScrollRow({super.key,required this.monthes});

//   MonthesModel monthes;
//   @override
//   State<ScrollRow> createState() => _ScrollRowState();
// }

// int selectedOption = 0;

// class _ScrollRowState extends State<ScrollRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Row(
//         children: [
//           Radio(
//               value: 1,
//               groupValue: selectedOption,
//               onChanged: (value) {
//                 setState(() {
//                   selectedOption = value!;
//                 });
//               }),
//           Text(
//             ,
//             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           )
//         ],
//       ),
//       VerticalScrollItems()
//     ]);
//   }
// }

class ScrollRow extends StatelessWidget {
  ScrollRow({super.key, required this.monthes});

  MonthesModel monthes;

  @override
  Widget build(BuildContext context) {
    int selectedOption = 0;

    return Column(children: [
      Row(
        children: [
          Radio(
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                // setState(() {
                //   selectedOption = value!;
                // }
                // );
              }),
          Text(
            monthes.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
      VerticalScrollItems(monthes: monthes)
    ]);
  }
}
