import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/services/get_info.dart';
import 'package:task/widgets/head_and_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int currentIndex = 0;

  final items = [
    Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZwwZczR7wNeA5aiAQ43sisomacw_offGr5KvTpvG1tcoL5A7d-1xt_0kXfbszAniBKk&usqp=CAU'),
    Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvanahX06oYOqKKP-uAKyS8pFVc8xSfUBRyBWY-tk6yYKDZW88nCifj4ZL3KQHzUiqic&usqp=CAU'),
    Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMZlxsjOZxEcixCkrUDXfqP1fantlUxVjnaQ&usqp=CAU')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
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
        body: FutureBuilder<List<MonthesModel>>(
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
                        Stack(children: [
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
                          Positioned(
                            right: 260,
                            top: 30,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: kPrimaryColor, shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              )),
                            ),
                          ),
                        ]),
                        Center(
                          child: DotsIndicator(
                            dotsCount: items.length,
                            position: currentIndex,
                            decorator: DotsDecorator(
                              activeColor: KSecondaryColor,
                              color: const Color.fromARGB(255, 216, 216, 216),
                              size: const Size.square(9.0),
                              activeSize: const Size(30.0, 9.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            elevation: 0,
                            color: Color.fromARGB(255, 253, 217, 162),
                            child: SizedBox(
                              width: 260,
                              height: 60,
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                        SizedBox(
                          height: 18,
                        ),
                        HeadAndWidget(
                          title: 'فيديوهات تمهيدية',
                          monthes: monthes[7],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "ابدأ ذاكر",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(width: 5,),
                                Text("اختر الفصل")
                              ],
                            ),
                            Container(
                              width: 70,
                              child: Divider(
                                thickness: 1,
                                color: KSecondaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
        scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Container(
                                        height: 70,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(
                                              "https://previews.123rf.com/images/jemastock/jemastock1602/jemastock160201543/52153080-science-concept-with-chemistry-icons-design-vector-illustration-10-eps-graphic.jpg"),
                                          backgroundColor: Colors.transparent,
                                        )),
                              ),
                            )
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
            }));
  }
}
