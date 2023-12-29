import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/features/first_page.dart';
import 'package:task/features/home/widgets/custom_image.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/services/get_home_page_info.dart';
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

  final List<Image> items = [
    Image.asset(AppImageAsset.homeBannerOne),
    Image.asset(AppImageAsset.homeBannerTwo),
    Image.asset(AppImageAsset.homeBannerThree),
  ];

  final _pageController = PageController(initialPage: 0);
  //  final HomePageModel homePageModel;

  int _page = 0;

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.medical_information,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        title: const Column(
          children: [
            Text(
              "اسم الطالب",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              "الصف الأول الثانوي",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
            // Text(
            //   "الترم الأول",
            //   style: TextStyle(fontSize: 10,color: Colors.white,),
            // ),
          ],
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return const Padding(
              padding: EdgeInsets.only(left: 10),
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
          child: FutureBuilder<HomePageModel>(
              future: AllHomePageService().getAllHomePage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.error);
                  HomePageModel homePageInfo = snapshot.data!;
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
                              items: items),
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
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Card(
                              elevation: 0,
                              color: const Color.fromARGB(255, 253, 217, 162),
                              child: SizedBox(
                                width: 320,
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
                          const SizedBox(
                            height: 18,
                          ),
                          HeadAndWidget(
                            title: 'فيديوهات تمهيدية',
                            homePageModel: HomePageModel(),
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
                                        fontSize: 20),
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
                                  buildImageWidget(
                                    AppImageAsset.homeImageOne,
                                  ),
                                  buildImageWidget(
                                    AppImageAsset.homeImageTwo,
                                  ),
                                  buildImageWidget(
                                    AppImageAsset.homeImageThree,
                                  ),
                                  buildImageWidget(
                                    AppImageAsset.homeImageFour,
                                  ),
                                  buildImageWidget(
                                    AppImageAsset.homeImageFive,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          HeadAndWidget(
                            title: 'المراجعة النهائية',
                            homePageModel: HomePageModel(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text("api error : there is an error"),
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
      // )
    );
  }
}
