import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:task/core/constants/colors.dart';
import 'package:task/core/constants/image_asset.dart';
import 'package:task/features/home/widgets/custom_image.dart';
import 'package:task/features/pdf/pdf_screen.dart';
import 'package:task/models/home_page_model.dart';
import 'package:task/services/get_home_page_info.dart';
import 'package:task/widgets/head_and_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int currentIndex = 0;

  final _pageController = PageController(initialPage: 0);

  final int _page = 0;

  int maxCount = 5;

  final Uri _url = Uri.parse('https://flutter.dev');

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
                  HomePageModel homePageModel = snapshot.data!;
                  //  PdfModel pdfModel = ;
                  List imgList = [
                    homePageModel.data!.sliders![0].file.toString(),
                    homePageModel.data!.sliders![1].file.toString(),
                    homePageModel.data!.sliders![2].file.toString(),
                  ];
                  List linkList = [
                    homePageModel.data!.sliders![0].link.toString(),
                    homePageModel.data!.sliders![1].link.toString(),
                    homePageModel.data!.sliders![2].link.toString(),
                  ];
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
                            items: homePageModel.data!.sliders!
                                .map((item) => GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                            builder: (_) => PdfScreen(homePageModel: homePageModel,)
                                            // PDFViewerFromUrl(
                                            //   url: homePageModel.data!.classes![0]
                                            //       .exams![0].answerPdfFile
                                            //       .toString(),
                                            // ),
                                            ),
                                      ),
                                      child: Center(
                                          child: Image.network(item.file!,
                                              fit: BoxFit.cover, width: 1000)),
                                    ))
                                .toList(),
                          ),
                          Center(
                            child: DotsIndicator(
                              dotsCount: homePageModel.data!.sliders!.length,
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
                          const SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: GestureDetector(
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
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          HeadAndWidget(
                            title: 'فيديوهات تمهيدية',
                            homePageModel: homePageModel,
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
                            homePageModel: homePageModel,
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
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text('${snapshot.error}');
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

  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF From Url'),
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
