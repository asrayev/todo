import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/myicons.dart';
import 'package:todo/widgets/add_task.dart';
import 'package:todo/windows/calendar.dart';
import 'package:todo/windows/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {

  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Index(),
    Calendar(),
    Container(),
    Focus(child: Container(color: Colors.green,),),
    Container(),
  ];
  List names= [
    "Index",
    "Calendar",
    "Add",
    "Focus",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: ((){}),
          icon: SvgPicture.asset(Myicons.menu),
          // icon: SvgPicture.asset(AppImages.ic_menu),
        ),
        backgroundColor: Colors.black,
        title: Text(names[_selectedIndex]),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child:  const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/301",
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),

      floatingActionButton: Stack(children: [
        Positioned(
          bottom: 34,
          left: 155.9,
          child: Container(
            width: 90,
            height: 45.5,
            decoration:  BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(76, 80),
                    bottomRight: Radius.elliptical(76, 80))),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 165,
          child: InkWell(
            onTap: ((){
              setState(() {
                _selectedIndex = 2;
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskWidget(onNewTask: () {  },);
                    });
              });
            }),











            child: Container(
                height: 72,
                width: 72,
                decoration:   BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF8687E7),
                ),
                child:  Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )),//ADD+
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          iconSize: 28,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.50),
          backgroundColor:  Color(0xFF363636),
          type: BottomNavigationBarType.fixed,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Index',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined),
              label: 'Focus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

//
// Container(
// height: 600,
// padding:  EdgeInsets.all(24),
// width: 375,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(16),
// topRight: Radius.circular(16),
// ),
// color: Color(0xFF363636),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Add Task" , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
// SizedBox(height: 20,),
// Container(
// decoration: BoxDecoration(
// border: Border.all(color: Colors.white, width: 1),
// borderRadius: BorderRadius.circular(8)
//
//
// ),
// child: TextFormField(
// decoration: const InputDecoration(
// border: InputBorder.none,
// labelStyle: TextStyle(color: Colors.white),
// hintStyle: TextStyle(color: Colors.white),
// hintText: "  Do"
//
// ),
//
// ),
// ),
// SizedBox(height: 20,),
// Container(
// height: 100,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.white, width: 1),
// borderRadius: BorderRadius.circular(8)
//
//
// ),
// child: TextFormField(
// decoration: const InputDecoration(
// border: InputBorder.none,
// labelStyle: TextStyle(color: Colors.white),
// hintStyle: TextStyle(color: Colors.white),
// hintText: "  Description"
//
// ),
//
// ),
// ),
// SizedBox(height: 50,),
// Row(
// children: [
// InkWell(
//
// child: SvgPicture.asset(Myicons.clock),
// onTap: (() async {
// var results = await showCalendarDatePicker2Dialog(
// context: context,
// config: CalendarDatePicker2WithActionButtonsConfig(),
// dialogSize: const Size(325, 400),
// initialValue: [],
// borderRadius: BorderRadius.circular(15),
// );
// }),
// ),
// SizedBox(width: 10,),
// SvgPicture.asset(Myicons.secondi),
// SizedBox(width: 10,),
// SvgPicture.asset(Myicons.flag),
// SizedBox(width: 250,),
// SvgPicture.asset(Myicons.send),
//
//
// ],
// )
// ],
// ),
// );