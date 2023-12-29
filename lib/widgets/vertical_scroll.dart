import 'package:flutter/material.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/monthes_model.dart';

class VerticalScrollItems extends StatelessWidget {
  const VerticalScrollItems(
      {super.key, this.colory = kDividerColor, required this.homePageModel});

  final HomePageModel homePageModel;

  final Color colory;

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
                color: colory,
              ),
              child: Card(
                elevation: 0,
                color: colory,
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
                          
                          homePageModel.data!.videosBasics![index].name.toString(),
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        Text(
                          homePageModel.data!.videosBasics![index].time.toString(),
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
