import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/features/first_page.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/services/get_info.dart';
import 'package:task/widgets/head_and_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int currentIndex = 0;

  final items = [
    Image.asset("AppImageAsset.homeBannerOne"),
    Image.asset("AppImageAsset.homeBannerTwo"),
    Image.asset("AppImageAsset.homeBannerThree"),
  ];
  

  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const FirstPage(),
    // const Page2(),
    // const Page3(),
    // const Page4(),
    // const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.medical_information),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
        title: const Column(
          children: [
            Text(
              "اسم الطالب",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "الصف الأول الثانوي",
              style: TextStyle(fontSize: 10),
            ),
            // Text(
            //   "الترم الأول",
            //   style: TextStyle(fontSize: 10),
            // ),
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR0NGNX89GD-iF2DlkwVislMgxyLFv39Bow5HbkrUbkQ&s'),
              ),
            );
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: FutureBuilder<List<MonthesModel>>(
              future: AllMonthesService().getAllMonthes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.error);
                  List<MonthesModel> monthes = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: items,
                          ),
                          Center(
                            child: DotsIndicator(
                              dotsCount: items.length,
                              position: currentIndex,
                              decorator: DotsDecorator(
                                activeColor: kDividerColor,
                                color: const Color.fromARGB(255, 216, 216, 216),
                                size: const Size.square(9.0),
                                activeSize: const Size(30.0, 9.0),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ),
                          ),
                          Center(
                            child: Flexible(
                              child: Card(
                                elevation: 0,
                                color: const Color.fromARGB(255, 253, 217, 162),
                                child: SizedBox(
                                  width: 260,
                                  height: 60,
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "امتحان اللايف",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "عندنا امتحان لايف هيبدأ الساعة 10 مساء",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      Image.network(
                                          "https://www.liveworksheets.com/themes/custom/lively/mstile-310x310.png"),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          HeadAndWidget(
                            title: 'فيديوهات تمهيدية',
                            monthes: monthes[7],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "ابدأ ذاكر",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("اختر الفصل")
                                ],
                              ),
                              const SizedBox(
                                width: 70,
                                child: Divider(
                                  thickness: 1,
                                  color: kDividerColor,
                                ),
                              ),
                              Wrap(
                                spacing: 2, // المسافة الأفقية بين العناصر
                                runSpacing: 1, // المسافة الرأسية بين الصفوف
                                children: <Widget>[
                                  buildImageWidget(AppImageAsset.homeImageOne,
                                      Colors.blue, "اسم الفصل"),
                                  buildImageWidget(AppImageAsset.homeImageTwo,
                                      Colors.green, "اسم الفصل"),
                                  buildImageWidget(AppImageAsset.homeImageThree,
                                      Colors.red, "اسم الفصل"),
                                  buildImageWidget(AppImageAsset.homeImageFour,
                                      Colors.purple, "اسم الفصل"),
                                  buildImageWidget(AppImageAsset.homeImageFive,
                                      Colors.blue, "اسم الفصل"),
                                ],
                              ),
                            ],
                          ),
                          HeadAndWidget(
                            title: 'المراجعة النهائية',
                            monthes: monthes[8],
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text("there is an error"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
      // PageView(
      //   controller: _pageController,
      //   physics: const NeverScrollableScrollPhysics(),
      //   children: List.generate(
      //       bottomBarPages.length, (index) => bottomBarPages[index]),
      // ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: const Color(0xFF424242),
              showLabel: false,
              notchColor: const Color(0xFF424242),

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.grey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                // log('current selected index $index');
                // _pageController.jumpToPage(index);
              },
            )
          : null,

    );
  }
}

buildImageWidget(String image, Color color, String text) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 37,
          backgroundImage: AssetImage(
            image,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        )
      ],
    ),
  );
}
