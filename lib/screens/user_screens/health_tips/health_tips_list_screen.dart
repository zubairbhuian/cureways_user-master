import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/screens/user_screens/health_tips/health_tips_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utils/const_color.dart';
import '../../../utils/mixins.dart';

class HealthtipsListScreen extends StatefulWidget {
  const HealthtipsListScreen({Key? key}) : super(key: key);

  @override
  State<HealthtipsListScreen> createState() => _HealthtipsListScreenState();
}

class _HealthtipsListScreenState extends State<HealthtipsListScreen> {
  bool isLoading = false;
  dynamic healthTipsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethealthTipsList();
  }

  Future<dynamic> gethealthTipsList() async {
    isLoading = true;
    healthTipsList = await ApiClient()
        .getData("https://cureways.vaccinehomebd.com/api/health-tips");
    if (healthTipsList == false) {
      isLoading = true;
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(healthTipsList);
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w,top: 12,bottom: 12),
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            isLoading == true
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      itemCount: healthTipsList["data"]["healthTips"].length,
                      itemBuilder: (context, int index) {
                        var vaccineData = healthTipsList["data"]["healthTips"];
                        DateTime parsedDate = DateFormat("MM-dd-yy HH:mm")
                            .parse(vaccineData[index]["created_at"].toString());
                        String formattedDate =
                            DateFormat("MM-dd-yy").format(parsedDate);
                        String formattedTime =
                            DateFormat("HH:mm").format(parsedDate);
                            
                            
                        // zb => Health tips card

                        return GestureDetector(
                          onTap: () {
                            // navigation 
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    HealthTipsDetailsScreen(
                                      name: vaccineData[index]["title"]
                                          .toString(),
                                      path: vaccineData[index]["image"]
                                          .toString(),
                                      details: vaccineData[index]
                                              ["description"]
                                          .toString(),
                                      type:
                                          "$formattedDate, Time: $formattedTime",
                                    )));
                          },
                          // card start here
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                          BorderRadius.circular(5),
                                  child: Container(
                                    height: 76,
                                    width: 76,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5)),
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
                                ),
                                const SizedBox(width: 14,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${vaccineData[index]["title"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color:
                                                ConstantsColor.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "${vaccineData[index]["description"]}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color:
                                                ConstantsColor.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date: $formattedDate, Time: $formattedTime",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color:
                                                    ConstantsColor.greyColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
