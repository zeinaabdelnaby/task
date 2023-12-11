import 'package:flutter/material.dart';
import 'package:task/controller/data/datasource/static/static.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/features/home/second_page.dart';

import '../../../core/constants/sharedprefrence.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController nextPage = PageController();
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            pageNumber = value;
          });
        },
        controller: nextPage,
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              onBoardingList[i].image!,
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.8),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              textAlign: TextAlign.center,
              onBoardingList[i].body!,
              style: const TextStyle(
                  fontSize: 17, color: customGreyColor, height: 1),
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 100,
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pageNumber > 0
                ? InkWell(
                    onTap: () {
                      Prefrence.setValue().then((value) {
                        Prefrence.getValue();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondPage()),
                        );
                      });
                    },
                    child: Container(
                      width: 110,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'تخطي',
                          style: TextStyle(
                            color: customGreyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  )
                // const CustomButtonOnBoarding(
                //     text: 'تخطي',
                //     color: customGreyColor,
                //     bgcolor: Colors.white,
                //   )
                : Container(),
            Center(
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      width: 25,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: i == pageNumber ? kprimaryColor : Colors.grey),
                    ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                pageNumber < 2
                    ? nextPage.animateToPage(pageNumber + 1,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeIn)
                    :
                     Prefrence.setValue().then((value) {
                        Prefrence.getValue();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondPage()),
                        );
                      });
              },
              child: Container(
                width: 110,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor,
                ),
                child: Center(
                  child: Text(
                    pageNumber < 2 ? "التالي" : "أنهى",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            )
            // const CustomButtonOnBoarding(
            //   text: "أنهى",
            //   color: Colors.white,
            //   bgcolor: kprimaryColor,
            // ),
          ],
        ),
      ),
    );
  }
}
