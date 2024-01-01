import 'package:flutter/material.dart';

import '../../utilis/const_color.dart';


class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({Key? key}) : super(key: key);

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  int _currentIndex = 0;
  final pages =[

    Center(
      child: const Text("Emergency",
      ),
    ),
    Center(child: const Text("Profile"))

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(

        decoration:  BoxDecoration(
            color: Colors.white,
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
          )],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )),
        child: BottomNavigationBar(

          backgroundColor: Colors.transparent,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ConstantsColor.primaryColor,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home'
            ),
            const BottomNavigationBarItem(
                icon:Icon(Icons.call),
                label: 'Emergency'
            ),
            const BottomNavigationBarItem(
                icon:Icon(Icons.person_2_outlined),
                label: 'Profile'
            ),

          ],
        ),
      ),
    );
  }
}
