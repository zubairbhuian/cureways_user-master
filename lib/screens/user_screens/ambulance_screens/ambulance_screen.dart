import 'package:cureways_user/data/network/apis/api_client.dart';
import 'package:cureways_user/screens/user_screens/ambulance_screens/ambulance_works_screen.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';

class AmbulanceScreen extends StatefulWidget {
  String userName;
  AmbulanceScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  String? selectDistrict = '', selectedPoliceStation = '', selecteArea = '';
  String? contactNumber = '', name = '';
  String? selectedDivisionId = '',
      selectedPoliceStationId = '',
      selecteAreaId = '';
  dynamic userName;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<dynamic> divisionList = [];

  bool isLoading = false;
  bool ispostLoading = false;
  dynamic areaManagementList;
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
    getAreaManagementList();
  }

  Future<dynamic> getAreaManagementList() async {
    isLoading = true;
    areaManagementList = await ApiClient()
        .getData("https://cureways.vaccinehomebd.com/api/areamManagement");

    if (areaManagementList == false) {
      isLoading = true;
    } else {
      setState(() {
        isLoading = false;
      });
      // final divisionData = areaManagementList[0]['original']['data']['divisions'];

      // divisionList=[divisionData];
    }
  }

  @override
  Widget build(BuildContext context) {
    print(areaManagementList);
    //this section areamangemenlist is convert to map

    //We initialize an empty list divisions to store the divisions retrieved from the API response.
    List<dynamic> policeStation = [];
    List<dynamic> divisions = [];
    List<dynamic> area = [];
    //We check if the areaManagementList is not null, and if it exists, we extract the divisions from it and assign them to the divisions list.
    if (areaManagementList != null) {
      divisions = areaManagementList[0]['original']['data']['divisions'];
      policeStation =
          areaManagementList[0]['original']['data']['policestations'];
      area = areaManagementList[0]['original']['data']['areas'];
    }

    //Next, we create a new list divisionNames using the map method to
    // extract only the names of the divisions from the divisions list.
    List<String> policeStationNames = policeStation
        .map<String>((policestations) => policestations["name"].toString())
        .toList();

    List<String> divisionNames = divisions
        .map<String>((division) => division['name'].toString())
        .toList();
    List<String> areaNames =
        area.map<String>((areas) => areas['name'].toString()).toList();
    return Scaffold(
      body: Container(
        color: ConstantsColor.backgroundColor,
        child: Column(
          children: [
            AppDefaultBar(title: "AMBULANCE", userNAme: userName),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                  child: Column(
                    children: [
                      Container(
                        height: 228,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: const Image(
                          image: AssetImage(
                              "assets/ambulance/ambulance_Image.png"),
                          height: 226,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Overseas Treatment: Accessing World-Class Healthcare Beyond Borders",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstantsColor.primaryColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    AmbulanceWorksScreen(userName: userName)));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ConstantsColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            "How it works?",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 4,
                        thickness: 1,
                        color: ConstantsColor.primaryColor,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text("Book Now",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ConstantsColor.primaryColor,
                            // decoration: TextDecoration.underline
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      const Divider(
                        height: 4,
                        thickness: 1,
                        color: ConstantsColor.primaryColor,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                buttonStyleData: const ButtonStyleData(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 00, right: 10),
                                ),
                                isExpanded: true,
                                hint: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select District",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantsColor.primaryColor),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                items: divisions.map((division) {
                                  final divisionId = division['id'].toString();
                                  final divisionName =
                                      division['name'].toString();
                                  return DropdownMenuItem(
                                    value: divisionId,
                                    child: Text(
                                      divisionName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                /* divisionNames
                                    .map((name) => DropdownMenuItem<String>(
                                          value: name,
                                          child: Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ))
                                    .toList(),*/
                                /* Mixins()
                                    .District
                                    .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    )))
                                    .toList(),*/
                                onChanged: (value) {
                                  selectedDivisionId = value.toString();
                                  selectDistrict = divisions
                                      .firstWhere((division) =>
                                          division['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  // selectDistrict = divisionNames[int.parse(value.toString())];

                                  print(selectedDivisionId);
                                  print(selectDistrict);
                                  //selectDistrict = value.toString();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select District';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  selectedDivisionId = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                buttonStyleData: const ButtonStyleData(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 00, right: 10),
                                ),
                                isExpanded: true,
                                hint: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Police Station",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantsColor.primaryColor),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                items: policeStation.map((policestations) {
                                  final policeStationId =
                                      policestations['id'].toString();
                                  final policeStationName =
                                      policestations['name'].toString();
                                  return DropdownMenuItem(
                                    value: policeStationId,
                                    child: Text(
                                      policeStationName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                /*Mixins()
                                    .District
                                    .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    )))
                                    .toList(),*/
                                onChanged: (value) {
                                  selectedPoliceStationId = value.toString();
                                  selectedPoliceStation = policeStation
                                      .firstWhere((policestationss) =>
                                          policestationss['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  // selectDistrict = divisionNames[int.parse(value.toString())];

                                  print(selectedPoliceStationId);
                                  print(selectedPoliceStation);
                                  //print('value => $value');
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select Police Station';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  selectedPoliceStationId = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField2(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                buttonStyleData: const ButtonStyleData(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 00, right: 10),
                                ),
                                isExpanded: true,
                                hint: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Area",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ConstantsColor.primaryColor),
                                    ),
                                    Text(
                                      "*",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                items: area.map((areas) {
                                  final areaId = areas['id'].toString();
                                  final areaName = areas['name'].toString();
                                  return DropdownMenuItem(
                                    value: areaId,
                                    child: Text(
                                      areaName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                /* areaNames
                                    .map((name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        )))
                                    .toList(),*/
                                onChanged: (value) {
                                  // print('value => $value');
                                  selecteAreaId = value.toString();
                                  selecteArea = area
                                      .firstWhere((areas) =>
                                          areas['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  print(selecteAreaId);
                                  print(selecteArea);
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Select Area";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  selecteArea = value.toString();
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomTextField(
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                labelText: 'Name ',
                                hintText: 'Name',
                                onChanged: (String value) {
                                  name = value;
                                },
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Enter Your Name'
                                      : null;
                                },
                              ),
                              CustomTextField(
                                controller: _numberController,
                                keyboardType: TextInputType.text,
                                labelText: 'Enter Your Mobile Number',
                                hintText: 'Mobile Number',
                                onChanged: (String value) {
                                  contactNumber = value;
                                },
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Enter Your Mobile Number'
                                      : null;
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: 52,
                        child: OutlinedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //print("validate");
                              setState(() {
                                ispostLoading = true;
                              });
                              var request = http.MultipartRequest(
                                  'POST',
                                  Uri.parse(
                                      "https://cureways.vaccinehomebd.com/api/store/ambulance"));
                              request.fields.addAll({
                                "division_id": selectedDivisionId.toString(),
                                "police_station_id":
                                    selectedPoliceStationId.toString(),
                                "area_id": selecteAreaId.toString(),
                                "division": selectDistrict.toString(),
                                "policestations":
                                    selectedPoliceStation.toString(),
                                "area": selecteArea.toString(),
                                "name": _nameController.text.toString(),
                                "phone": _numberController.text.toString(),
                                "created_at": "",
                                "updated_at": ""
                              });
                              http.StreamedResponse response =
                                  await request.send();
                              if (response.statusCode == 200) {
                                _numberController.clear();
                                toastMessage(
                                    "Ambulance Request Uploaded Successfully ",
                                    ConstantsColor.primaryColor);
                                setState(() {
                                  ispostLoading = false;
                                });
                              } else {
                                setState(() {
                                  ispostLoading = false;
                                });
                                toastMessage(
                                    "Ambulance Request not Uploaded Successfully ,Try again ",
                                    ConstantsColor.primaryColor);
                              }
                            } else {
                              setState(() {
                                ispostLoading = false;
                              });
                              toastMessage("Input All required Information ",
                                  ConstantsColor.primaryColor);
                            }

                            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AmbulanceList()));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: ConstantsColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: ispostLoading == false
                              ? const Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              : const Visibility(
                                  visible: false, child: SizedBox()),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void toastMessage(String message, Color backgroundColor) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
