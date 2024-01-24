import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/network/models/get_diet_list_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:cureways_user/utils/style.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';

class GetDietListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('userBox');
  List<DietListData>? dietList;
  List<DietListData> uniqueList = [];
  List<DietListData> todayFilteredList = [];

  // **** Filtered List with One key
  void onFilteredList(String key) {
    if (dietList != null) {
      todayFilteredList =
          dietList!.where((element) => element.date == key).toList();
      kLogger.e(todayFilteredList.length);
    }
  }

  // **** on UnikDietList
  void onUnikDietList() {
    if (dietList != null && dietList!.isNotEmpty) {
      Set<String> uniqueDates = {};
      dietList
          ?.where((element) => uniqueDates.add(element.date!))
          .forEach((element) {
        uniqueList.add(element);
        update();
      });
    }
  }

  getDietList() async {
    final FormData formData = FormData.fromMap({
      "user_id": _myBox.get('userId'),
    });
    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.getDiet, formData);
    if (res.statusCode == 200) {
      if (res.data["data"].length == 0) {
 
      } else {
        // if there is no data
        dietList = (res.data['data'] as List)
            .map((item) => DietListData.fromJson(item))
            .toList();
               String todayDate = "30-Nov--0001"; ////DateFormat('DD-MM-yyyy').format(DateTime.now());
        onFilteredList(todayDate);
        update();
        // onFilteredList('30-Nov--0001');
        onUnikDietList();

        update();
      }

      update();
    } else {
      update();
    }

  }
}
