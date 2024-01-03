import 'package:cureways_user/data/network/constants/endpoints.dart';
import 'package:cureways_user/data/network/constants/server.dart';
import 'package:cureways_user/data/network/controllers/base/base_controller.dart';
import 'package:cureways_user/data/network/models/base/base_model.dart';
import 'package:cureways_user/data/network/models/get_diet_list_model.dart';
import 'package:cureways_user/data/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';

class GetDietListController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  final _myBox = Hive.box('userBox');
  List<DietListData>? dietList;

  getDietList() async {
    final FormData formData = FormData.fromMap({
      "user_id": _myBox.get('userId'),
    });

    BaseModel res = await BaseController.to.apiService
        .makePostRequestWithFormData(
            Endpoints.server + Endpoints.getDiet, formData);
    if (res.statusCode == 200) {
      if (res.data["data"].length == 0) {
        dietList = [];
        update();
      } else {
        // if there is no data
        dietList = (res.data['data'] as List)
            .map((item) => DietListData.fromJson(item))
            .toList();

        update();
      }

      update();
    } else {
      update();
    }

    // Map body = {'user_id': _myBox.get('userId')};
    // String jsonBody = json.encode(body);
    // server
    //     .postRequestWithToken(endPoint: Endpoints.getDiet, body: jsonBody)
    //     .then((response) {
    //   print(json.decode(response.body));
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     print(jsonResponse);
    //     var dietListData = GetDietListModel.fromJson(jsonResponse);

    //     dietList = <DietListData>[];
    //     dietList.addAll(dietListData.data!);

    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //   } else {
    //     loader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(
    //         message: 'Something is wrong', backgroundColor: Colors.red);
    //   }
    // });
  }
}
