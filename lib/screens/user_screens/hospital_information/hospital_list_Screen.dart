import 'package:cached_network_image/cached_network_image.dart';
import 'package:cureways_user/screens/user_screens/hospital_information/hospital_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utilis/const_color.dart';
import '../../../utilis/mixins.dart';
import '../../../widgets/appbar.dart';
import 'hospital_information.dart';
class HospitalListScreen extends StatefulWidget {
  String userName;
 HospitalListScreen({Key? key,required this.userName}) : super(key: key);

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  dynamic userName;
  bool isLoading = false;
  dynamic hospitalList;
  @override
  void initState() {
    userName= widget.userName;
    // TODO: implement initState
    super.initState();
    getHospitalList();
  }
  Future<dynamic>getHospitalList()async{
    isLoading = true;
    hospitalList = await ApiClient().getData("https://cureways.vaccinehomebd.com/api/hospitals");
    if (hospitalList == false){
      isLoading = true;
    }else{
      setState(() {
        isLoading =false;
      });
    }

  }
  Widget build(BuildContext context) {
    print(hospitalList);
    return Scaffold(
      body:Column(
        children: [
          AppDefaultBar(title: "HOSPITAL INFORMATION", userNAme: userName),
          const SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount:hospitalList["data"]["hospitals"].length,
              itemBuilder: (context, int index) {
                var  hospitalData =hospitalList["data"]["hospitals"];
                return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalDetailsScreen(
                        hospitalName: hospitalData [index]["name"].toString(),
                        imagePath:  hospitalData [index]["image"].toString(),
                        hopitalDetails:  hospitalData [index][ "description"].toString(),
                        hospitalAddress:  hospitalData [index]["address"].toString(),
                        userName: userName,
                        email:  hospitalData [index]["phone"].toString(),
                        number:  hospitalData [index]["email"].toString(),)));},
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 76,
                                  width: 76,
                                  decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child:CachedNetworkImage(
                                    imageUrl: hospitalData[index]["image"].toString(),
                                    placeholder: (context, url) =>
                                    const Center(
                                        child:
                                        CircularProgressIndicator()),
                                    errorWidget:
                                        (context, url, error) =>
                                    const Icon(
                                      Icons.error,
                                      color: ConstantsColor.primaryColor,
                                    ),
                                    fit:BoxFit.fill ,
                                  ),
                                ),
                                SizedBox(width: 16,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${hospitalData[index][ "name"]}",
                                            overflow: TextOverflow.ellipsis,
                                           // maxLines: 1,
                                            softWrap: false,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: ConstantsColor.primaryColor,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                 Text(
                                   "${hospitalData[index][ "address"]}",
                                   overflow: TextOverflow.fade,
                                   maxLines: 1,
                                   softWrap: false,
                                   style: const TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 12,
                                     color: ConstantsColor.primaryColor,
                                   ),
                                 ),

                                    const SizedBox(
                                      height: 4,
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
