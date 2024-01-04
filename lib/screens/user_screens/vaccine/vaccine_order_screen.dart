import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../data/network/apis/api_client.dart';
import '../../../utils/const_color.dart';
import '../../../widgets/appbar.dart';
import 'package:http/http.dart' as http;

class VaccineOrderScreen extends StatefulWidget {
  String? userName;
  String? vaccineId;
  VaccineOrderScreen(
      {Key? key, required this.vaccineId, required this.userName})
      : super(key: key);

  @override
  State<VaccineOrderScreen> createState() => _VaccineOrderScreenState();
}

class _VaccineOrderScreenState extends State<VaccineOrderScreen> {
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
  String? userName;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  dynamic areaManagementList;
  String? vaccineId;
  bool isLoading = false;
  bool ispostLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    vaccineId = widget.vaccineId;
    userName = widget.userName ?? "";
    print("id===========$vaccineId");
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
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> policeStation = [];
    List<dynamic> divisions = [];
    List<dynamic> area = [];

    if (areaManagementList != null) {
      divisions = areaManagementList[0]['original']['data']['divisions'];
      policeStation =
          areaManagementList[0]['original']['data']['policestations'];
      area = areaManagementList[0]['original']['data']['areas'];
    }
    return Scaffold(
      body: Column(
        children: [
          AppDefaultBar(title: "VACCINE ORDER", userNAme: userName!),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 12),
                child: Column(
                  children: [
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
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                labelText: 'Name ',
                                hintText: 'Name',
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
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                labelText: '  Enter Your Mobile Number',
                                hintText: ' Mobile Number',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
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
                                    "https://cureways.vaccinehomebd.com/api/vaccine/products/order"));
                            request.fields.addAll({
                              "division_id": selectedDivisionId.toString(),
                              "police_station_id":
                                  selectedPoliceStationId.toString(),
                              "area_id": selecteAreaId.toString(),
                              "division": selectDistrict.toString(),
                              "policestations":
                                  selectedPoliceStation.toString(),
                              "area": selecteArea.toString(),
                              //"name":_nameController.text.toString(),
                              "phone": _numberController.text.toString(),
                              "type": selectedServiceTypeId.toString(),
                              "product_id": vaccineId.toString(),
                              "created_at": "",
                              "updated_at": ""
                            });
                            http.StreamedResponse response =
                                await request.send();
                            if (response.statusCode == 200) {
                              _numberController.clear();
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
                          //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BloodBankListScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: ConstantsColor.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'ORDER',
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
