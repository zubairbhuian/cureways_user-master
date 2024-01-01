import 'package:cureways_user/screens/user_screens/ambulance_screens/ambulance_details_screen.dart';
import 'package:flutter/material.dart';


import '../../../utilis/const_color.dart';
import '../../../utilis/mixins.dart';
import '../../../widgets/appbar.dart';

class AmbulanceList extends StatefulWidget {
  const AmbulanceList({Key? key}) : super(key: key);

  @override
  State<AmbulanceList> createState() => _AmbulanceListState();
}

class _AmbulanceListState extends State<AmbulanceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          AppDefaultBar(title: "AMBULANCE", userNAme: "user"),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: Mixins().ambulanceDetails.length,
                itemBuilder: (context,int index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            Container(
                              height: 76,
                              width: 76,
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Image(image: AssetImage(
                                "${Mixins().ambulanceDetails.elementAt(index)["images"]}",
                              ),

                                fit: BoxFit.cover,
                              ),
                            ),
                            const VerticalDivider(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( "${Mixins().ambulanceDetails.elementAt(index)["name"]}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,

                                          color: ConstantsColor.primaryColor
                                      ),
                                    ),
                                    const SizedBox(width: 110,),
                                    const Image(
                                      image: AssetImage("assets/doctor_image/3dot Icon.png"),
                                      color: Color(0xff8F8F8F),
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                                Text( "${Mixins().ambulanceDetails.elementAt(index)["address"]}",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,

                                    color: Color(0xff8F8F8F),
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff4E8C82
                                        ).withOpacity(.30),
                                      ),
                                      child: const Center(
                                        child: Text( "Online",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Color(0xff0D534B),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width:85 ,),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AmbulanceDetailsScreen()));

                                      },
                                      child: Container(
                                        height: 32,
                                        width: 109,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: ConstantsColor.primaryColor
                                        ),
                                        child: const Center(
                                          child: Text( "Contact",
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
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )

        ],
      ),
    );
  }
}
