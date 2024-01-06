import 'package:flutter/material.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/monthes_model.dart';

class VerticalScrollItems extends StatelessWidget {
  const VerticalScrollItems(
      {super.key, required this.homePageModel});

  final HomePageModel homePageModel;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      // width: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount:
         homePageModel.data?.videosBasics?.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor.fromHex(homePageModel.data!.videosBasics![index].backgroundColor.toString()),
              ),
              child: Card(
                elevation: 0,
                color: HexColor.fromHex(homePageModel.data!.videosBasics![index].backgroundColor.toString()) ,
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          homePageModel.data != null ? 
                          homePageModel.data!.videosBasics![index].name.toString(): "no data",
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        Text(
                          homePageModel.data != null ? 
                          homePageModel.data!.videosBasics![index].time.toString(): "no data",
                          style: const TextStyle(
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


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}