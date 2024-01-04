import 'package:cureways_user/data/network/apis/api_client.dart';
import 'package:cureways_user/data/network/controllers/blood_bank_search_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
import 'blood_bank_list_screen.dart';

class BloodBankScreen extends StatefulWidget {
  const BloodBankScreen({Key? key}) : super(key: key);

  @override
  State<BloodBankScreen> createState() => _BloodBankScreenState();
}

class _BloodBankScreenState extends State<BloodBankScreen> {
  String? selectDistrict = '',
      selectedPoliceStation = '',
      selectedArea = '',
      bloodGroup = '',
      selectedRhFactor = '';
  String? selectedDivisionId = '',
      selectedPoliceStationId = '',
      selectedAreaId = '',
      selectedBloodGroupId = '',
      selectedRhFactorId = '';

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _myBox = Hive.box('userBox');

  BloodBankSearchController bloodBankSearchController =
      BloodBankSearchController();

  @override
  void initState() {
    getAreaManagementList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloodBankSearchController = Get.put(BloodBankSearchController());
    super.didChangeDependencies();
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
    print(areaManagementList);

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

    return GetBuilder<BloodBankSearchController>(
      init: BloodBankSearchController(),
      builder: (bloodBankSearch) => Scaffold(
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
                      padding:  EdgeInsets.only(left: 20.w, right: 20.w),
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
                                        padding: EdgeInsets.only(
                                            left: 00, right: 10),
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
                                                color: ConstantsColor
                                                    .primaryColor),
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
                                        padding: EdgeInsets.only(
                                            left: 00, right: 10),
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
                                                color: ConstantsColor
                                                    .primaryColor),
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
                                      items:
                                          policeStation.map((policestations) {
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
                                        padding: EdgeInsets.only(
                                            left: 00, right: 10),
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
                                                color: ConstantsColor
                                                    .primaryColor),
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
                                        final areaName =
                                            areas['name'].toString();
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
                                        selectedAreaId = value.toString();
                                        selectedArea = area
                                            .firstWhere((areas) =>
                                                areas['id']?.toString() ==
                                                value.toString())?['name']
                                            ?.toString();
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return "Select Area";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        selectedArea = value.toString();
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
                                        padding: EdgeInsets.only(
                                            left: 00, right: 10),
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
                                                color: ConstantsColor
                                                    .primaryColor),
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
                                        selectedBloodGroupId = value.toString();
                                        final selectedGroup =
                                            bloodGroups.firstWhere((group) =>
                                                group['value'] == value);
                                        bloodGroup =
                                            selectedGroup['text'].toString();
                                        print(
                                            "blood group => $selectedBloodGroupId");
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please Select BloodGroup';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        selectedBloodGroupId = value.toString();
                                        final selectedGroup =
                                            bloodGroups.firstWhere((group) =>
                                                group['value'] == value);
                                        bloodGroup =
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
                                        padding: EdgeInsets.only(
                                            left: 00, right: 10),
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
                                                color: ConstantsColor
                                                    .primaryColor),
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
                                        selectedRhFactorId = value.toString();
                                        final selectedRhFactorType =
                                            rhFactors.firstWhere(
                                          (type) => type['value'] == value,
                                          orElse: () =>
                                              {'text': '', 'value': ''},
                                        );

                                        selectedRhFactor =
                                            selectedRhFactorType['text']
                                                .toString();
                                      },
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
                                          orElse: () =>
                                              {'text': '', 'value': ''},
                                        );

                                        selectedRhFactor =
                                            selectedRhFactorType['text']
                                                .toString();
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
                                  bloodBankSearch.getSearchedBloodBankList(
                                    context,
                                    selectedDivisionId.toString(),
                                    selectedPoliceStationId.toString(),
                                    selectedAreaId.toString(),
                                    selectedBloodGroupId.toString(),
                                    selectedRhFactorId.toString(),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: ConstantsColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: bloodBankSearch.loader
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : const Text(
                                        'SUBMIT',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
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
      )),
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
