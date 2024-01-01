import 'package:cureways_user/screens/user_screens/virtual_lab/virtual_lab_work_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utilis/const_color.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/appbar.dart';

class VirtualLabScreen extends StatefulWidget {
  String userName;
  VirtualLabScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<VirtualLabScreen> createState() => _VirtualLabScreenState();
}

class _VirtualLabScreenState extends State<VirtualLabScreen> {
  String? selectDistrict = '',
      selectedPoliceStation = '',
      selecteArea = '',
      selectedBloodgroup = '',
      selectedServiceType = '';
  String? contactNumber = '', name = '';
  String? selectedDivisionId = '',
      selectedPoliceStationId = '',
      selecteAreaId = '',
      selectedBloodgroupId = '',
      selectedServiceTypeId = '';

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  dynamic userName;

  //integrate Areamangement Api
  bool isLoading = false;
  bool ispostLoading = false;
  @override
  void initState() {
    userName = widget.userName;
    // TODO: implement initState
    super.initState();
    getAreaManagementList();
  }

  dynamic areaManagementList;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(areaManagementList);

    //this section areamangemenlist is convert to map

    //We initialize an empty list divisions to store the divisions retrieved from the API response.
    List<dynamic> policeStation = [];
    List<dynamic> divisions = [];
    List<dynamic> area = [];
    List<Map<String, dynamic>> serviceType = [];

    //We check if the areaManagementList is not null, and if it exists, we extract the divisions from it and assign them to the divisions list.
    if (areaManagementList != null) {
      divisions = areaManagementList[0]['original']['data']['divisions'];
      policeStation =
          areaManagementList[0]['original']['data']['policestations'];
      area = areaManagementList[0]['original']['data']['areas'];
      serviceType = (areaManagementList[0]['original']['data']['serviceType']
              as Map<String, dynamic>)
          .entries
          .map<Map<String, dynamic>>(
              (entry) => {'text': entry.value, 'value': entry.key})
          .toList();
    }
    return Scaffold(
      body: Container(
        color: const Color(0xffF3F8FF),
        child: Column(
          children: [
            AppDefaultBar(title: "VIRTUAL LAB", userNAme: userName),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Virtual Lab: Revolutionizing Healthcare Diagnostics",
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
                                    VirtualLabWorkScreen(userName: userName)));
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
                                onChanged: (value) {
                                  selectedDivisionId = value.toString();
                                  selectDistrict = divisions
                                      .firstWhere((division) =>
                                          division['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  //print(selectedDivisionId);
                                  //  print(selectDistrict);
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
                                onChanged: (value) {
                                  selectedPoliceStationId = value.toString();
                                  selectedPoliceStation = policeStation
                                      .firstWhere((policestationss) =>
                                          policestationss['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  // selectDistrict = divisionNames[int.parse(value.toString())];

                                  //print(selectedPoliceStationId);
                                  //print(selectedPoliceStation);
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
                                onChanged: (value) {
                                  // print('value => $value');
                                  selecteAreaId = value.toString();
                                  selecteArea = area
                                      .firstWhere((areas) =>
                                          areas['id']?.toString() ==
                                          value.toString())?['name']
                                      ?.toString();
                                  //print(selecteAreaId);
                                  // print(selecteArea);
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
                                      "Service Type",
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
                                items: serviceType.map((type) {
                                  final text = type['text'].toString();
                                  final value = type['value'].toString();
                                  return DropdownMenuItem<String>(
                                    value: text,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  selectedServiceTypeId =
                                      value; // Store the selected bloodgroupId
                                  final selectedServiceTypes =
                                      serviceType.firstWhere(
                                    (type) => type['value'] == value,
                                    orElse: () => {'text': '', 'value': ''},
                                  );

                                  selectedServiceType =
                                      selectedServiceTypes['text'].toString();
                                  print(
                                      "blood group => $selectedServiceTypeId ");
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please Select RHFactor';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  labelText: '   Name ',
                                  hintText: ' Name',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                ),
                                onChanged: (String value) {
                                  name = value;
                                },
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'Enter Your Name'
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _numberController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  labelText: '   Mobile Number ',
                                  hintText: ' Mobile Number',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                  labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal),
                                ),
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
                                      "https://cureways.vaccinehomebd.com/api/store/virtuallab"));
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
                                "type": selectedServiceTypeId.toString(),
                                "created_at": "",
                                "updated_at": ""
                              });
                              http.StreamedResponse response =
                                  await request.send();
                              if (response.statusCode == 200) {
                                _numberController.clear();
                                _nameController.clear();
                                toastMessage(
                                    "Virtual Lab Info Send Successfully",
                                    ConstantsColor.primaryColor);
                                setState(() {
                                  ispostLoading = false;
                                });
                              } else {
                                setState(() {
                                  ispostLoading = false;
                                });
                                toastMessage(
                                    "Virtual Lab Info Send  not  Successfully ,Try again ",
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
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
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
