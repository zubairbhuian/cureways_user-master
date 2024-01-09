import 'package:cureways_user/screens/user_screens/health_tips/health_tips_list_screen.dart';
import 'package:cureways_user/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/const_color.dart';

class HealtipsMainScreen extends StatefulWidget {
  String userName;
  HealtipsMainScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HealtipsMainScreen> createState() => _HealtipsMainScreenState();
}

class _HealtipsMainScreenState extends State<HealtipsMainScreen>
    with TickerProviderStateMixin {
  String? search = '';
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: const CustomAppBar(title: Text("Health Tips")),
      // appBar: AppBar(
      //   toolbarHeight: 152,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.white,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(12.0),
      //         bottomRight: Radius.circular(12.0)),
      //   ),
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         //SizedBox(height: 42,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Expanded(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "Hi,$userName!",
      //                     textAlign: TextAlign.start,
      //                     style: const TextStyle(
      //                         fontSize: 22,
      //                         fontWeight: FontWeight.w700,
      //                         color: Color(0xff0F4B97)),
      //                   ),
      //                   const Text(
      //                     "Welcome back",
      //                     textAlign: TextAlign.start,
      //                     style: TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.w400,
      //                         color: Color(0xff0F4B97)),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             SvgPicture.asset(
      //               "assets/home_screen/bell.svg",
      //               height: 32,
      //               width: 32,
      //               color: const Color(0xff0F4B97),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: const HealthtipsListScreen(),
      ),
    );
  }
}
