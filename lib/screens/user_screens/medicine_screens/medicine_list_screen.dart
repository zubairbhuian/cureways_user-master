import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/screens/user_screens/medicine_screens/medicine_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utils/const_color.dart';
import '../../../utils/mixins.dart';

class MedicineListScreen extends StatefulWidget {
  String userName;
  MedicineListScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  String? search = '';
  final TextEditingController _searchController = TextEditingController();

  bool isLoading = false;
  dynamic medicineList;
  dynamic userName;
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
    getMedicineList();
  }

  Future<dynamic> getMedicineList() async {
    isLoading = true;
    medicineList = await ApiClient()
        .getData("https://cureways.vaccinehomebd.com/api/medicine");
    if (medicineList == false) {
      isLoading = true;
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(medicineList);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0)),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //SizedBox(height: 42,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, $userName!",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff0F4B97)),
                        ),
                        const Text(
                          "Welcome back",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0F4B97)),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/home_screen/bell.svg",
                    height: 32,
                    width: 32,
                    color: const Color(0xff0F4B97),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          isLoading == true
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: medicineList["data"]["medicine"].length,
                    //  itemCount: Mixins().medicineList.length,
                    itemBuilder: (context, int index) {
                      var medicineData = medicineList["data"]["medicine"];
                      return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MedicineDetailsScreen(
                                            vaccineName: medicineData[index]
                                                    ["name"]
                                                .toString(),
                                            imagePath: medicineData[index]
                                                    ["image"]
                                                .toString(),
                                            vaccineDetails: medicineData[index]
                                                    ["description"]
                                                .toString(),
                                            vaccineType: medicineData[index]
                                                    ["product_type"]
                                                .toString(),
                                            price: medicineData[index]["price"]
                                                .toString(),
                                          )));
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 76,
                                    width: 76,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: medicineData[index]["image"]
                                          .toString(),
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: ConstantsColor.primaryColor,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${medicineData[index]["name"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: ConstantsColor.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${medicineData[index]["product_type"]}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: ConstantsColor.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Product Price:${medicineData[index]["price"]}TK",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: ConstantsColor.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ));
                    },
                  ),
                )
        ],
      ),
    );
  }
}
