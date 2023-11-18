import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/services/get_info.dart';
import 'package:task/widgets/scroll_row.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}



class _FirstPageState extends State<FirstPage> {
int _selectedIndex = 0;
  int _selectedMonth = 0;
  int priceAfterDisc = 0;
  bool buttonPressed = false;
  final List<Color> colors = [Colors.green, Colors.blue, Colors.purple];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<List<MonthesModel>>(
                future: AllMonthesService().getAllMonthes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.error);
                    List<MonthesModel> monthess = snapshot.data!;
                    void onButtonPressed() {
                      setState(() {
                        buttonPressed = true;
                        priceAfterDisc = monthess[_selectedMonth].price - 30;
                      });
                    }

                    void onSelectedIndexChanged(int? value) {
                      if (value != null) {
                        setState(() {
                          buttonPressed = false;
                          _selectedMonth = value;
                          priceAfterDisc = monthess[_selectedMonth].price - 30;
                        });
                      }
                    }

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 23,
                                  width: 23,
                                  decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                  bottom: 2,
                                  child: Container(
                                    height: 1,
                                    width: 25,
                                    color: Colors.blue,
                                  ),
                                ),
                                const Text(
                                  "اختر الشهر",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: kPrimaryColor,
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) =>
                                  ScrollRow(
                                    colory: colors[index],
                                    monthes: monthess[index + 7],
                                    index: index,
                                    selectedIndex: _selectedMonth,
                                    onSelectedChanged: onSelectedIndexChanged,
                                  )),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 7,
                          shadowColor: Colors.grey,
                          child: SizedBox(
                            width: 450,
                            child: Row(
                              children: [
                                const Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'إدخال كود الخصم',
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none))),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      onButtonPressed();
                                    },
                                    child: const Text(
                                      "استخدام",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("إجمالي الطلب",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '${monthess[_selectedMonth].price.toString()} ج.م',
                              style: buttonPressed
                                  ? const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                    )
                                  : const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("إجمالي الطلب بعد الخصم",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                buttonPressed
                                    ? '${priceAfterDisc.toString()} ج.م'
                                    :'${monthess[_selectedMonth].price.toString()} ج.م',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 220.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            border:
                                Border.all(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'أكمل الطلب',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
                })),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 27,
              color: kPrimaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: kPrimaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: kPrimaryColor,
              size: 29,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt_outlined,
              color: kPrimaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle_outline_outlined,
              color: kPrimaryColor,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
