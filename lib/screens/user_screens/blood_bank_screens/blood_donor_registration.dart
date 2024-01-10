import 'package:cureways_user/utils/int_extensions.dart';
import 'package:cureways_user/widgets/custom_textfield.dart';
import 'package:cureways_user/widgets/profile_pic_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
import 'package:http/http.dart' as http;

class BloodDonorRegistrationScreen extends StatefulWidget {
  const BloodDonorRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<BloodDonorRegistrationScreen> createState() =>
      _BloodDonorRegistrationScreenState();
}

class _BloodDonorRegistrationScreenState
    extends State<BloodDonorRegistrationScreen> {
  String? selectDistrict = '',
      selectedPoliceStation = '',
      selecteArea = '',
      selectedBloodgroup = '',
      selectedrhFactor = '';
  String? contactNumber = '', name = '';
  String? selectedDivisionId = '',
      selectedPoliceStationId = '',
      selecteAreaId = '',
      selectedBloodgroupId = '',
      selectedRhFactorId = '';

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _myBox = Hive.box('userBox');

  //integrate Areamangement Api
  bool isLoading = false;
  bool ispostLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAreaManagementList();
  }

  dynamic areaManagementList;
  Future<dynamic> getAreaManagementList() async {
    isLoading = true;
    areaManagementList = await ApiClient()
        .getData("https://cureways.webbysys.click/api/areamManagement");

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
//print("division data is here ${checkdivisonData}");
    //this section areamangemenlist is convert to map

    //We initialize an empty list divisions to store the divisions retrieved from the API response.
    List<dynamic> policeStation = [];
    List<dynamic> divisions = [];
    List<dynamic> area = [];
    List<Map<String, dynamic>> bloodGroups = [];
    List<Map<String, dynamic>> rhFactors = [];
    //We check if the areaManagementList is not null, and if it exists, we extract the divisions from it and assign them to the divisions list.
    if (areaManagementList != null) {
      divisions = areaManagementList[0]['original']['data']['divisions'];
      policeStation =
          areaManagementList[0]['original']['data']['policestations'];
      area = areaManagementList[0]['original']['data']['areas'];
      bloodGroups = (areaManagementList[0]['original']['data']['bloodgroup']
              as Map<String, dynamic>)
          .entries
          .map<Map<String, dynamic>>(
              (entry) => {'text': entry.value, 'value': entry.key})
          .toList();
      rhFactors = (areaManagementList[0]['original']['data']['rhfector']
              as Map<String, dynamic>)
          .entries
          .map<Map<String, dynamic>>(
              (entry) => {'text': entry.value, 'value': entry.key})
          .toList();
    }
    return Scaffold(
        body: Column(
      children: [
        AppDefaultBar(
            title: "BLOOD BANK", userNAme: "${_myBox.get('userName')}"),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: ConstantsColor.backgroundColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 228,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Image(
                              image: AssetImage(
                                  "assets/blood_bank/blood_beg_Image.png"),
                              height: 226,
                              width: double.maxFinite,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  10.height,
                                  // const ProfilePicCard(),
                                  20.height,
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 00, right: 10),
                                    ),
                                    isExpanded: true,
                                    hint: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select District",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  ConstantsColor.primaryColor),
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
                                      final divisionId =
                                          division['id'].toString();
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 00, right: 10),
                                    ),
                                    isExpanded: true,
                                    hint: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Police Station",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  ConstantsColor.primaryColor),
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
                                      selectedPoliceStationId =
                                          value.toString();
                                      selectedPoliceStation = policeStation
                                          .firstWhere((policestationss) =>
                                              policestationss['id']
                                                  ?.toString() ==
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
                                      selectedPoliceStationId =
                                          value.toString();
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 00, right: 10),
                                    ),
                                    isExpanded: true,
                                    hint: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Area",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  ConstantsColor.primaryColor),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 00, right: 10),
                                    ),
                                    isExpanded: true,
                                    hint: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Blood Group",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  ConstantsColor.primaryColor),
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
                                    items: bloodGroups.map((group) {
                                      final text = group['text'].toString();
                                      final value = group['value'].toString();
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          text,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      // print('value => $value');
                                      selectedBloodgroupId = value
                                          .toString(); // Store the selected bloodgroupId
                                      final selectedGroup =
                                          bloodGroups.firstWhere((group) =>
                                              group['value'] == value);
                                      selectedBloodgroup =
                                          selectedGroup['text'].toString();
                                      print(
                                          "blood group => $selectedBloodgroupId");
                                    },
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select BloodGroup';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      selectedBloodgroupId = value.toString();
                                      final selectedGroup =
                                          bloodGroups.firstWhere((group) =>
                                              group['value'] == value);
                                      selectedBloodgroup =
                                          selectedGroup['text'].toString();
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    buttonStyleData: const ButtonStyleData(
                                      height: 60,
                                      padding:
                                          EdgeInsets.only(left: 00, right: 10),
                                    ),
                                    isExpanded: true,
                                    hint: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Rh Factor",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  ConstantsColor.primaryColor),
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
                                    items: rhFactors.map((type) {
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
                                      selectedRhFactorId = value
                                          .toString(); // Store the selected bloodgroupId
                                      final selectedRhFactorType =
                                          rhFactors.firstWhere(
                                        (type) => type['value'] == value,
                                        orElse: () => {'text': '', 'value': ''},
                                      );

                                      selectedrhFactor =
                                          selectedRhFactorType['text']
                                              .toString();
                                      //print("blood group => $selectedRhFactorId ");
                                    },
                                    /* (value) {
                                      selectedRhFactorId = value; // Store the selected bloodgroupId
                                      final selectedRhFactorType= rhFactors.firstWhere((type) => type['value'] == value);
                                      selectedrhFactor = selectedRhFactorType['text'].toString();
                                      print("blood group => $selectedRhFactorId ");
                                    },*/
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Select RHFactor';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      selectedRhFactorId = value.toString();
                                      final selectedRhFactorType =
                                          rhFactors.firstWhere(
                                        (type) => type['value'] == value,
                                        orElse: () => {'text': '', 'value': ''},
                                      );

                                      selectedrhFactor =
                                          selectedRhFactorType['text']
                                              .toString();
                                    },
                                  ),
                                  12.height,
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
                                    keyboardType: TextInputType.number,
                                    labelText: 'Mobile Number ',
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
                                          "https://cureways.webbysys.click/api/bloodbanks/store"));
                                  request.fields.addAll({
                                    "division_id":
                                        selectedDivisionId.toString(),
                                    "police_station_id":
                                        selectedPoliceStationId.toString(),
                                    "area_id": selecteAreaId.toString(),
                                    "division": selectDistrict.toString(),
                                    "policestations":
                                        selectedPoliceStation.toString(),
                                    "area": selecteArea.toString(),
                                    "name": _nameController.text.toString(),
                                    "phone": _numberController.text.toString(),
                                    "blood_group":
                                        selectedBloodgroupId.toString(),
                                    "rh_fector": selectedRhFactorId.toString()
                                  });
                                  http.StreamedResponse response =
                                      await request.send();
                                  if (response.statusCode == 200) {
                                    _numberController.clear();
                                    _nameController.clear();
                                    toastMessage("Registration Successful",
                                        ConstantsColor.primaryColor);
                                    setState(() {
                                      ispostLoading = false;
                                    });
                                  } else {
                                    setState(() {
                                      ispostLoading = false;
                                    });
                                    toastMessage(
                                        "Registrationt not  Successfully ,Try again ",
                                        ConstantsColor.primaryColor);
                                  }
                                } else {
                                  setState(() {
                                    ispostLoading = false;
                                  });
                                  toastMessage(
                                      "Input All required Information ",
                                      ConstantsColor.primaryColor);
                                }
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
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
