import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/screens/user_screens/vaccine/vaccine_details.dart';
import 'package:cureways_user/screens/user_screens/vaccine/vaccine_order_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class VaccineList extends StatefulWidget {
  String userName;
  VaccineList({Key? key, required this.userName}) : super(key: key);

  @override
  State<VaccineList> createState() => _VaccineListState();
}

class _VaccineListState extends State<VaccineList> {
  bool isLoading = false;
  dynamic vaccineList;
  dynamic userName;

  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
    getVaccineList();
  }

  Future<dynamic> getVaccineList() async {
    isLoading = true;
    vaccineList = await ApiClient()
        .getData("https://cureways.vaccinehomebd.com/api/vaccine/products");
    if (vaccineList == false) {
      isLoading = true;
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(vaccineList);
    return Scaffold(
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            AppDefaultBar(title: "VACCINE INFORMATION", userNAme: userName),
            isLoading == true
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: vaccineList["data"]["vaccine"].length,
                      itemBuilder: (context, int index) {
                        var vaccineData = vaccineList["data"]["vaccine"];
                        return Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 76,
                                    width: 76,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: vaccineData[index]["image"]
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
                                  const VerticalDivider(),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${vaccineData[index]["name"]}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                color: ConstantsColor
                                                    .primaryColor),
                                          ),
                                          const VerticalDivider(),
                                          /*const Image(
                                          image: AssetImage("assets/doctor_image/3dot Icon.png"),
                                          color: Color(0xff8F8F8F),
                                          height: 24,
                                          width: 24,
                                          fit: BoxFit.cover,
                                        ),*/
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${vaccineData[index]["product_type"]}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xff8F8F8F),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VaccineDetailsScreen(
                                                            vaccineName:
                                                                vaccineData[index]
                                                                        ["name"]
                                                                    .toString(),
                                                            imagePath:
                                                                vaccineData[index]
                                                                        [
                                                                        "image"]
                                                                    .toString(),
                                                            vaccineDetails:
                                                                vaccineData[index]
                                                                        [
                                                                        "description"]
                                                                    .toString(),
                                                            vaccineType: vaccineData[
                                                                        index][
                                                                    "product_type"]
                                                                .toString(),
                                                            userName: userName,
                                                          )));
                                            },
                                            child: Container(
                                              height: 24,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color(0xff4E8C82)
                                                    .withOpacity(.30),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Details",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Color(0xff0D534B),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const VerticalDivider(),
                                          const VerticalDivider(),
                                          const VerticalDivider(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VaccineOrderScreen(
                                                            vaccineId:
                                                                vaccineData[index]
                                                                        ["id"]
                                                                    .toString(),
                                                            userName: userName,
                                                          )));
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 109,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: ConstantsColor
                                                      .primaryColor),
                                              child: const Center(
                                                child: Text(
                                                  "Order Now",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )));
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
