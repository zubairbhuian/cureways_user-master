import 'package:flutter/material.dart';

import '../../utils/const_color.dart';


class MainBoardScreen extends StatefulWidget {
  const MainBoardScreen({Key? key}) : super(key: key);

  @override
  State<MainBoardScreen> createState() => _MainBoardScreenState();
}

class _MainBoardScreenState extends State<MainBoardScreen> {
  int _currentIndex = 0;
  final pages =[

    const Center(
      child: Text("Emergency",
      ),
    ),
    const Center(child: Text("Profile"))

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
              offset: const Offset(0, 3),
          )],
            borderRadius: const BorderRadius.only(
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
          items: const [
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.call),
                label: 'Emergency'
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.person_2_outlined),
                label: 'Profile'
            ),

          ],
        ),
      ),
    );
  }
}
