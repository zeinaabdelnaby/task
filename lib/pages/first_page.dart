import 'package:flutter/material.dart';
import 'package:task/models/monthes_model.dart';
import 'package:task/services/get_info.dart';
import 'package:task/widgets/scroll_row.dart';
import 'package:task/widgets/vertical_scroll.dart';

class FirstPage extends StatefulWidget {
  //  FirstPage({super.key,this.monthes});

  late MonthesModel monthes;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

int selectedOption = 1;
int _selectedIndex = 0;
const List<Widget> _widgetOptions = <Widget>[
  Text('Home Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('Search Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('Profile Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
];

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 68, 255),
        shape: RoundedRectangleBorder(
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
        title: Column(
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
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
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
                    List<MonthesModel> monthes = snapshot.data!;
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
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                  bottom: 9,
                                  child: Container(
                                    height: 1,
                                    width: 25,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  "اختر الشهر",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 96, 68, 255),
                                  shape: BoxShape.circle),
                              child: Center(
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
                                    monthes: monthes[index],
                                  )),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 7,
                          shadowColor: Colors.grey,
                          child: Container(
                            width: 450,
                            child: Row(
                              children: [
                                Flexible(
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
                                    onPressed: () {},
                                    child: Text(
                                      "استخدام",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("إجمالي الطلب",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              '${monthes.price.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("إجمالي الطلب بعد الخصم",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("106 ج.م",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 220.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                            color: const Color.fromARGB(255, 96, 68, 255),
                            border:
                                new Border.all(color: Colors.white, width: 2.0),
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
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
                    return Center(
                      child: Container(child: Text("there is an error")),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: 27,
              color: const Color.fromARGB(255, 96, 68, 255),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              color: const Color.fromARGB(255, 96, 68, 255),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: const Color.fromARGB(255, 96, 68, 255),
              size: 29,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt_outlined,
              color: const Color.fromARGB(255, 96, 68, 255),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle_outline_outlined,
              color: const Color.fromARGB(255, 96, 68, 255),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
