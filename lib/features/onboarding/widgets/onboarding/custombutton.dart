// import 'package:flutter/material.dart';

// class CustomButtonOnBoarding extends StatelessWidget {
//   const CustomButtonOnBoarding(
//       {Key? key, required this.text, required this.color, required this.bgcolor})
//       : super(key: key);
//   final String text;
//   final Color color;
//   final Color bgcolor;
//    final int i = 0;

//   @override
//   Widget build(BuildContext context) {
//     PageController nextPage = PageController();
//     return InkWell(
//       onTap: () {
//         nextPage.animateToPage(i + 1,
//             duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
//       },
//       child: Container(
//         width: 110,
//         height: 45,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: bgcolor,
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               color: color,
//               fontWeight: FontWeight.bold,
//               fontSize: 23,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
